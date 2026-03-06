-- Disable default keymaps so we can set our own
vim.g.nvim_surround_no_mappings = true

local M = {
    'kylechui/nvim-surround',
    version = '*',
    event = 'BufRead',
}

M.opts = {
    surrounds = {
        ['{'] = { add = { '{', '}' } },
        ['['] = { add = { '[', ']' } },
        ['('] = { add = { '(', ')' } },
        ['<'] = { add = { '<', '>' } },
    },
}

M.config = function(_, opts)
    require('nvim-surround').setup(opts)

    vim.keymap.set(
        'n',
        'gs',
        '<Plug>(nvim-surround-normal)',
        { desc = 'Add surrounding pair (normal)' }
    )
    vim.keymap.set(
        'x',
        'gs',
        '<Plug>(nvim-surround-visual)',
        { desc = 'Add surrounding pair (visual)' }
    )
    vim.keymap.set(
        'n',
        'ds',
        '<Plug>(nvim-surround-delete)',
        { desc = 'Delete surrounding pair' }
    )
    vim.keymap.set(
        'n',
        'cs',
        '<Plug>(nvim-surround-change)',
        { desc = 'Change surrounding pair' }
    )
end

return M
