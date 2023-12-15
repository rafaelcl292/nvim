require("oil").setup {
    delete_to_trash = false,
    skip_confirm_for_simple_edits = true,
    keymaps = {
        ['q'] = "actions.close",
        -- ['g/'] = "actions.toggle_trash",
    },
    view_options = {
        show_hidden = true,
    }
}

vim.keymap.set("n", "<leader>e", ":Oil<CR>", { noremap = true })
