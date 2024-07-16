local M = { 'stevearc/oil.nvim' }

M.opts = {
    delete_to_trash = false,
    skip_confirm_for_simple_edits = true,
    keymaps = {
        ['q'] = 'actions.close',
        ['<leader>e'] = 'actions.close',
        ['-'] = 'actions.parent',
        ['<CR>'] = 'actions.select',
        ['<C-p>'] = 'actions.preview',
        ['gh'] = 'actions.toggle_hidden',
        ['J'] = 'actions.preview_scroll_down',
        ['K'] = 'actions.preview_scroll_up',
    },
    use_default_keymaps = false,
    view_options = {
        show_hidden = false,
    },
}

M.keys = {
    { '<leader>e', '<cmd>Oil<cr>' },
}

return M
