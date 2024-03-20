local function lsp_config()
    local lsp = require('lsp-zero').preset()
    local cmp_nvim_lsp = require('cmp_nvim_lsp')
    local capabilities = cmp_nvim_lsp.default_capabilities()

    lsp.use('lua_ls', {
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = {
                    version = 'LuaJIT',
                },
                diagnostics = {
                    disable = { 'missing-fields' },
                    globals = { 'vim' },
                },
            },
        },
    })

    lsp.use('clangd', {
        capabilities = capabilities,
        cmd = {
            'clangd',
            '--offset-encoding=utf-16',
            '--fallback-style=webkit',
        },
    })

    lsp.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr, remap = true }
        local function bind(key, cmd)
            vim.keymap.set({ 'n', 'v' }, key, cmd, opts)
        end

        bind('<leader>d', vim.diagnostic.open_float)
        bind('[d', vim.diagnostic.goto_prev)
        bind(']d', vim.diagnostic.goto_next)
        bind('<F2>', vim.lsp.buf.rename)
        bind('gd', vim.lsp.buf.definition)
        bind('gi', vim.lsp.buf.implementation)
        bind('gr', vim.lsp.buf.references)
        vim.keymap.set('n', '<CR>', vim.lsp.buf.hover, opts)
        bind('<leader>c', vim.lsp.buf.code_action)
    end)

    lsp.setup()

    -- nvim-cmp
    local cmp = require('cmp')
    local ls = require('luasnip')
    ls.config.setup()

    require('luasnip/loaders/from_vscode').lazy_load()

    cmp.setup({
        snippet = {
            expand = function(args) ls.lsp_expand(args.body) end,
        },
        preselect = cmp.PreselectMode.None,
        mapping = cmp.mapping.preset.insert({
            ['<A-i>'] = cmp.mapping.confirm({ select = true }),
            ['<C-q>'] = cmp.mapping.close(),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<A-p>'] = cmp.mapping.select_prev_item(),
            ['<A-n>'] = cmp.mapping.select_next_item(),
            ['<A-l>'] = cmp.mapping(function()
                if ls.expand_or_locally_jumpable() then ls.expand_or_jump() end
            end, { 'i', 's' }),
            ['<A-h>'] = cmp.mapping(function()
                if ls.locally_jumpable(-1) then ls.jump(-1) end
            end, { 'i', 's' }),
            ['<C-l>'] = cmp.mapping(function()
                if ls.expand_or_locally_jumpable() then ls.expand_or_jump() end
            end, { 'i', 's' }),
            ['<C-h>'] = cmp.mapping(function()
                if ls.locally_jumpable(-1) then ls.jump(-1) end
            end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
            { name = 'luasnip' },
            { name = 'nvim_lsp' },
            { name = 'path' },
        }, {
            { name = 'buffer' },
        }),
    })

    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' },
        },
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline({
            ['<C-n>'] = {
                c = function(f) f() end,
            },
            ['<C-p>'] = {
                c = function(f) f() end,
            },
            ['<C-h>'] = {
                c = function() end,
            },
            ['<C-j>'] = {
                c = function() end,
            },
        }),
        sources = cmp.config.sources({
            { name = 'path' },
        }, {
            { name = 'cmdline' },
        }),
    })

    -- autopairs
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
end

local function conform_config()
    local conform = require('conform')
    conform.setup()

    conform.formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofmt', 'goimports' },
        sh = { 'shfmt' },
        python = { 'black', 'isort' },
        ocaml = { 'ocamlformat' },
        javascript = { 'prettier' },
        xml = { 'xmlformat' },
    }

    conform.formatters.stylua = {
        prepend_args = {
            '--indent-type',
            'Spaces',
            '--quote-style',
            'AutoPreferSingle',
            '--column-width',
            '79',
            '--collapse-simple-statement',
            'Always',
        },
    }

    conform.formatters.shfmt = {
        prepend_args = { '-i', '4', '-ci' },
    }

    conform.formatters.black = {
        prepend_args = { '--line-length', '79' },
    }

    vim.keymap.set(
        { 'v', 'n' },
        '<leader>s',
        function()
            require('conform').format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end
    )
end

local function mason_config()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')

    mason.setup()
    mason_lspconfig.setup({
        ensure_installed = {
            'rust_analyzer',
            'tsserver',
            'html',
            'tailwindcss',
            'emmet_ls',
            'lua_ls',
            'cssls',
            'gopls',
        },

        automatic_installation = true,
    })

    require('mason-tool-installer').setup({
        ensure_installed = {
            'python-lsp-server',
            'bash-language-server',
            'lua-language-server',
            'stylua',
            'goimports',
            'shfmt',
            'black',
            'isort',
        },
    })
end

return {
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        config = lsp_config,
        dependencies = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },

            -- Mason
            {
                'williamboman/mason.nvim',
                dependencies = {
                    'WhoIsSethDaniel/mason-tool-installer.nvim',
                    'williamboman/mason-lspconfig.nvim',
                },
                config = mason_config,
            },

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            {
                'L3MON4D3/LuaSnip',
                build = 'make install_jsregexp',
                dependencies = 'rafamadriz/friendly-snippets',
            },
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',

            -- Formatting
            {
                'stevearc/conform.nvim',
                dependencies = 'williamboman/mason.nvim',
                config = conform_config,
            },

            -- Auto-pairs
            {
                'windwp/nvim-autopairs',
                event = 'InsertEnter',
                config = true,
            },
        },
    },
}
