require("oil").setup {
    delete_to_trash = false,
    skip_confirm_for_simple_edits = true,
    keymaps = {
        ['q'] = "actions.close",
        ['<leader>e'] = "actions.close"
    },
    view_options = {
        show_hidden = false,
    }
}

vim.keymap.set("n", "<leader>e", ":Oil<CR>", { noremap = true })
