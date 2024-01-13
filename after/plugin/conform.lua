require('conform').setup({
    formatters_by_ft = {
        lua = { 'stylua' },
        python = { 'isort', 'black' },
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
    },

})

vim.keymap.set({ 'v', 'n' }, '<leader>s', function()
    require('conform').format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
    })
end)
