require("noice").setup({
    commands = {
        history = {
            view = "popup",
            opts = {
                format = {
                    "{date} ",
                    "{event}",
                    { "{kind}", before = { ".", hl_group = "NoiceFormatKind" } },
                    " ",
                    "{title} ",
                    "{cmdline} ",
                    "\n{message}\n",
                },
            },
        },
        last = {
            view = "popup",
            opts = {
                format = {
                    "{date} ",
                    "{event}",
                    { "{kind}", before = { ".", hl_group = "NoiceFormatKind" } },
                    " ",
                    "{title} ",
                    "{cmdline} ",
                    "\n{message}",
                },
            },
        }
    },
})


vim.keymap.set(
    { 'n', 'v' },
    '<leader>:',
    ':Noice<CR>',
    { noremap = true, silent = true }
)
vim.keymap.set(
    { 'n', 'v' },
    '<leader>;',
    ':Noice last<CR>',
    { noremap = true, silent = true }
)
