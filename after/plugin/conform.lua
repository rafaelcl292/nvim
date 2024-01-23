local conform = require('conform')
conform.setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'autopep8' },
        javascript = { 'prettier' },
        typescript = { 'prettier' },
        typescriptreact = { 'prettier' },
        javascriptreact = { 'prettier' },
        html = { 'prettier' },
        css = { 'prettier' },
        json = { 'prettier' },
        yaml = { 'prettier' },
        markdown = { 'prettier' },
        rust = { 'rustfmt' },
        go = { 'gofmt', 'goimports' },
        sh = { 'shfmt' },
    },
})

conform.formatters.prettier = {
    prepend_args = { '--tab-width', '4' },
}

conform.formatters.stylua = {
    command = 'stylua',
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
