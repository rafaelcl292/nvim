local system_prompt = [[
You are a helpful AI assistant that helps users modify code.

If the user requests any modifications to the code, return the complete, updated version of the code, including all original content, without line numbers. Ensure the updated code is functional and adheres to best practices. Enclose the code within a markdown code block, specifying the language. Output a concise description of the changes made before the code block. Only output the code that was selected by the user.

Format your response as follows:
Concise description of changes.
```(LANGUAGE)
New complete version of the code
```

If the user asks a question, provide a short, direct answer.
]]

return {
    'CopilotC-Nvim/CopilotChat.nvim',
    build = 'make tiktoken',
    dependencies = {
        { 'zbirenbaum/copilot.lua' },
        { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    keys = {
        { '<leader>j', '<cmd>CopilotChatToggle<cr>', mode = { 'n', 'v' } },
        { 'gC', '<cmd>CopilotChatCommit<cr>', mode = { 'n', 'v' } },
    },
    event = 'VeryLazy',
    opts = {
        system_prompt = system_prompt,
        model = 'gemini-2.0-flash-001',
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
