require('noice').setup({
    messages = {
        view = 'messages',
        view_error = 'messages',
        view_warning = 'messages',
        view_history = 'messages',
        view_search = false,
    },
    commands = {
        history = {
            view = 'popup',
            opts = {
                format = {
                    '{date} ',
                    '{event}',
                    {
                        '{kind}',
                        before = { '.', hl_group = 'NoiceFormatKind' },
                    },
                    ' ',
                    '{title} ',
                    '{cmdline} ',
                    '\n{message}\n',
                },
            },
            filter = {},
        },
        last = {
            view = 'messages',
            opts = {
                format = {
                    '{message}',
                },
            },
            filter = {},
        },
    },
    lsp = {
        progress = {
            enabled = false,
        },
        message = {
            enabled = false,
        },
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
