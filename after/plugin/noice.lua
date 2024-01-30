local commands = {
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
}

require('noice').setup({
    messages = {
        view_history = 'messages',
        view_search = false,
    },
    commands = commands,
    lsp = {
        progress = {
            enabled = false,
        },
        message = {
            enabled = false,
        },
    },
    routes = {
        {
            view = 'messages',
            filter = { event = 'msg_show', min_height = 2 },
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
