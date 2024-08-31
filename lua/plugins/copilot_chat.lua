return {
    'CopilotC-Nvim/CopilotChat.nvim',
    branch = 'canary',
    dependencies = {
        { 'zbirenbaum/copilot.lua' },
        { 'nvim-lua/plenary.nvim' },
    },
    keys = {
        { '<leader>j', '<cmd>CopilotChatToggle<cr>', mode = { 'n', 'v' } },
    },
    opts = {
        debug = false,
        show_help = false,
        mappings = {
            complete = {
                detail = '',
                insert = '',
            },
            accept_diff = {
                normal = '<A-i>',
                insert = '<A-i>',
            },
        },
    },
}
