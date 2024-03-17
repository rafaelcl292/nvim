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

local function config_surround()
    require('mini.surround').setup({
        custom_surroundings = nil,

        n_lines = 1,

        search_method = 'cover_or_nearest',

        silent = true,

        mappings = {
            add = 'gs',
            delete = 'ds',
            replace = 'cs',

            find = '',
            find_left = '',
            highlight = '',
            update_n_lines = '',
            suffix_last = '',
            suffix_next = '',
        },
    })
end

return {
    { 'echasnovski/mini.ai', config = config_ai },
    { 'echasnovski/mini.surround', config = config_surround },
}
