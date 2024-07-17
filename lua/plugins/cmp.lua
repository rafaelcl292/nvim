M = { 'hrsh7th/nvim-cmp' }

M.event = { 'InsertEnter', 'CmdlineEnter' }

M.dependencies = {
    {
        'L3MON4D3/LuaSnip',
        build = 'make install_jsregexp',
        dependencies = 'rafamadriz/friendly-snippets',
        event = 'VeryLazy',
    },
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    { url = 'https://codeberg.org/FelipeLema/cmp-async-path' },
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lua',
    'saadparwaiz1/cmp_luasnip',
    'Snikimonkd/cmp-go-pkgs',
    {
        'windwp/nvim-autopairs',
        config = true,
        event = 'VeryLazy',
    },
}

function M.config()
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
            ['<C-e>'] = function(fallback) fallback() end,
            ['<A-i>'] = cmp.mapping.confirm({ select = true }),
            ['<C-q>'] = cmp.mapping.close(),
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
        matching = { disallow_symbol_nonprefix_matching = false },
        sources = cmp.config.sources({
            { name = 'luasnip' },
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'async_path' },
            { name = 'go_pkgs' },
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

return M
