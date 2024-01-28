local conform = require('conform')
conform.setup()

conform.formatters_by_ft = {
    lua = { 'stylua' },
    go = { 'gofmt', 'goimports' },
    sh = { 'shfmt' },
    python = { 'black', 'isort' },
}

conform.formatters.stylua = {
    prepend_args = {
        '--indent-type',
        'Spaces',
        '--quote-style',
        'AutoPreferSingle',
        '--column-width',
        '80',
        '--collapse-simple-statement',
        'Always',
    },
}

conform.formatters.shfmt = {
    prepend_args = { '-i', '4', '-ci' },
}

conform.formatters.black = {
    prepend_args = { '--line-length', '80' },
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
