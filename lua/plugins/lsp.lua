local M = { 'neovim/nvim-lspconfig' }

M.event = 'VeryLazy'

M.dependencies = {
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'saghen/blink.cmp',
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
}

local function on_attach(args)
    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client == nil then return end
    if client.config.name == 'copilot' then return end

    local opts = { buffer = bufnr, remap = true }

    vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', '<CR>', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', '<leader>C', vim.lsp.buf.code_action, opts)

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
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
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
    local capabilities = require('blink.cmp').get_lsp_capabilities()
    vim.lsp.enable('gleam')
    vim.lsp.enable('ty')
    vim.lsp.enable('zls')

    require('mason').setup()
    require('mason-lspconfig').setup({
        ensure_installed = {
            'rust_analyzer',
            'html',
            'emmet_ls',
            'lua_ls',
            'gopls',
            'ruff',
            'bashls',
        },
        automatic_enable = {
            exclude = { 'lua_ls', 'clangd' },
        },
    })

    vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        settings = {
            Lua = {
                diagnostics = {
                    disable = { 'missing-fields' },
                },
            },
        },
    })

    vim.lsp.config('clangd', {
        capabilities = capabilities,
        cmd = {
            'clangd',
            '--offset-encoding=utf-16',
        },
    })

    vim.api.nvim_create_autocmd('LspAttach', {
        callback = on_attach,
    })

    vim.diagnostic.config({
        signs = true,
        underline = true,
        virtual_text = true,
        severity_sort = true,
    })
end

return M
