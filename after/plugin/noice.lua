require('noice').setup({
    messages = {
        view_search = 'notify',
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
        },
        last = {
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
                    '\n{message}',
                },
            },
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
