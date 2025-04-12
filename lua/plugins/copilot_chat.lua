local function commit_message()
    return require('CopilotChat').ask(
        'Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.',
        {
            model = 'gpt-4o',
            context = { 'git:staged' },
        }
    )
end

return {
    'CopilotC-Nvim/CopilotChat.nvim',
    build = 'make tiktoken',
    dependencies = {
        { 'zbirenbaum/copilot.lua' },
        { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    keys = {
        { '<leader>j', '<cmd>CopilotChatToggle<cr>', mode = { 'n', 'v' } },
        { 'gC', commit_message, mode = { 'n', 'v' } },
    },
    event = 'VeryLazy',
    opts = {
        model = 'gemini-2.5-pro',
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
