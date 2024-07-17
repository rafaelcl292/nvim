local M = { 'neovim/nvim-lspconfig' }

M.event = 'BufReadPre'

M.dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'hrsh7th/cmp-nvim-lsp',
    { 'folke/neodev.nvim', opts = {} },
}

local function on_attach(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client.config.name == 'GitHub Copilot' then return end

    local opts = { buffer = bufnr, remap = true }

    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<CR>', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>C', vim.lsp.buf.code_action, opts)

    -- highlight references (delay is defined by `set updatetime`)
    if client and client.server_capabilities.documentHighlightProvider then
        local highlight_augroup =
            vim.api.nvim_create_augroup('lsp-highlight', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = args.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = args.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup(
                'lsp-detach',
                { clear = true }
            ),
            callback = function(event)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({
                    group = highlight_augroup,
                    buffer = event.buf,
                })
            end,
        })
    end
end

function M.config()
    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = {
            'rust_analyzer',
            'tsserver',
            'html',
            'tailwindcss',
            'emmet_ls',
            'lua_ls',
            'cssls',
            'gopls',
            'pyright',
            'bashls',
        },
        automatic_installation = true,
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    require('mason-lspconfig').setup_handlers({
        function(server_name)
            require('lspconfig')[server_name].setup({
                capabilities = capabilities,
            })
        end,
        ['lua_ls'] = function()
            require('lspconfig').lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            disable = { 'missing-fields' },
                        },
                    },
                },
            })
        end,
        ['clangd'] = function()
            require('lspconfig').clangd.setup({
                capabilities = capabilities,
                cmd = {
                    'clangd',
                    '--offset-encoding=utf-16',
                },
            })
        end,
    })

    require('mason-tool-installer').setup({
        ensure_installed = {
            'stylua',
            'goimports',
            'shfmt',
            'black',
            'isort',
            'fixjson',
            'xmlformatter',
            'prettier',
            'yamlfmt',
        },
    })

    vim.api.nvim_create_autocmd('LspAttach', {
        callback = on_attach,
    })
end

return M
