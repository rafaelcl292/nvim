local M = {
    'kylechui/nvim-surround',
    version = '*',
}

M.opts = {
    keymaps = {
        normal = 'gs',
        visual = 'gs',
        delete = 'ds',
        change = 'cs',
        insert = false,
        insert_line = false,
        normal_cur = false,
        normal_line = false,
        normal_cur_line = false,
        visual_line = false,
        change_line = false,
    },
    surrounds = {
        ['{'] = { add = { '{', '}' } },
        ['['] = { add = { '[', ']' } },
        ['('] = { add = { '(', ')' } },
        ['<'] = { add = { '<', '>' } },
    },
}

return M
