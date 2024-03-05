require('illuminate').configure({
    providers = {
        'lsp',
        'treesitter',
    },
    min_count_to_highlight = 2,
    modes_allowlist = { 'n' },
})
