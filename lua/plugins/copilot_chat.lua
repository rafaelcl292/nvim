local system_prompt = [[
Follow the user's instructions exactly.
Keep responses brief and impersonal.
Assume the user is on a Linux machine; provide system-specific commands when relevant.
Code snippets may include line number prefixes—use these for reference, but omit them in output.

When presenting code changes:

- Wrap the actual code in triple backticks with the appropriate language identifier.
- Output only the complete replacement code for the selected block, without any header.
- Match original indentation.
- Include all necessary lines (no omissions).
- Exclude line number prefixes.
]]

return {
    'CopilotC-Nvim/CopilotChat.nvim',
    build = 'make tiktoken',
    dependencies = {
        { 'zbirenbaum/copilot.lua' },
        { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    keys = {
        { '<leader>j', '<cmd>CopilotChatToggle<cr>', mode = 'v' },
        { '<leader>j', 'ggVG<cmd>CopilotChatToggle<cr>', mode = 'n' },
        { 'gC', '<cmd>CopilotChatCommit<cr>', mode = { 'n', 'v' } },
    },
    event = 'VeryLazy',
    config = {
        model = 'gpt-4.1',
        system_prompt = system_prompt,
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
