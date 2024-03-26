local function config()
    require('illuminate').configure({
        providers = {
            'lsp',
            'treesitter',
        },
        min_count_to_highlight = 2,
        modes_allowlist = { 'n' },
        under_cursor = false,
    })
end

return {
    'RRethy/vim-illuminate',
    config = config,
}
