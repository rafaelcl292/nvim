local M = { 'neovim/nvim-lspconfig' }

M.event = 'VeryLazy'

M.dependencies = {
    'mason-org/mason.nvim',
    'mason-org/mason-lspconfig.nvim',
    'saghen/blink.cmp',
    {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = function()
            local config_dir = vim.fn.stdpath('config')
            config_dir = vim.fs.normalize(vim.uv.fs_realpath(config_dir) or config_dir)
            local library = { '${3rd}/luv/library' }
            for _, plugin in pairs(require('lazy.core.config').plugins) do
                if vim.uv.fs_stat(plugin.dir .. '/lua') then
                    library[#library + 1] = plugin.dir
                end
            end
            table.sort(library)
            return {
                library = library,
                enabled = function(root_dir)
                    if vim.g.lazydev_enabled == false then return false end
                    root_dir = vim.fs.normalize(vim.uv.fs_realpath(root_dir) or root_dir)
                    return root_dir == config_dir
                        or vim.startswith(root_dir, config_dir .. '/')
                end,
            }
        end,
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
    vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, opts)

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
        ensure_installed = {},
        automatic_enable = {
            exclude = { 'clangd' },
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
