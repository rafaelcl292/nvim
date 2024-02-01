require('oil').setup({
    delete_to_trash = false,
    skip_confirm_for_simple_edits = true,
    keymaps = {
        ['q'] = 'actions.close',
        ['<leader>e'] = 'actions.close',
        ['-'] = 'actions.parent',
        ['<CR>'] = 'actions.select',
        ['<C-p>'] = 'actions.preview',
        ['gh'] = 'actions.toggle_hidden',
    },
    use_default_keymaps = false,
    view_options = {
        show_hidden = false,
    },
})

vim.keymap.set('n', '<leader>e', ':Oil<CR>', { silent = true })
