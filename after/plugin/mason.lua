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
