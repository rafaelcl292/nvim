return {
    'zbirenbaum/copilot.lua',
    event = 'InsertEnter',
    config = {
        enabled = true,
        keymap = {
            accept = false,
            dismiss = false,
            accept_word = false,
            jump_prev = false,
            jump_next = false,
            refresh = false,
            open = false,
        },
        filetypes = {
            ['copilot-chat'] = false,
            lua = true,
            ['*'] = true,
        },
        suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = false,
            keymap = {
                accept = '<Tab>',
                dismiss = '<C-q>',
                accept_word = '<C-a>',
                next = false,
                prev = false,
            },
        },
    },
}
