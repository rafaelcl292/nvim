local function config_ai()
    local spec_treesitter = require('mini.ai').gen_spec.treesitter

    require('mini.ai').setup({
        n_lines = 100,
        search_method = 'cover_or_nearest',
        silent = true,
        custom_textobjects = {
            m = spec_treesitter({
                a = '@function.outer',
                i = '@function.inner',
            }),
            i = spec_treesitter({
                a = { '@conditional.outer', '@loop.outer' },
                i = { '@conditional.inner', '@loop.inner' },
            }),
            C = spec_treesitter({
                a = '@class.outer',
                i = '@class.inner',
            }),
            l = spec_treesitter({
                a = '@loop.outer',
                i = '@loop.inner',
            }),
            c = spec_treesitter({
                a = '@comment.outer',
                i = '@comment.inner',
            }),
            r = spec_treesitter({
                a = '@return.outer',
                i = '@return.inner',
            }),
            b = spec_treesitter({
                a = '@block.outer',
                i = '@block.inner',
            }),
        },
    })
end

return {
    'echasnovski/mini.ai',
    config = config_ai,
}
