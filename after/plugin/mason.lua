local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()
mason_lspconfig.setup({
    ensure_installed = {
        'pyright',
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

require('mason-tool-installer').setup {
    ensure_installed = {
        'bash-language-server',
        'lua-language-server',
        'stylua',
        'revive',
        'goimports',
        'jsonlint',
        'yamllint',
    },
}
