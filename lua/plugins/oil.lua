local opts = {
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

local config = function()
    require('oil').setup(opts)
    vim.keymap.set('n', '<leader>e', ':Oil<CR>', { silent = true })
end

return {
    'stevearc/oil.nvim',
    config = config,
}
