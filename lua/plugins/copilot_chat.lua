local function selection(source)
    local select = require('CopilotChat.select')
    return select.visual(source) or select.buffer(source)
end

local function commit_message()
    local chat = require('CopilotChat')
    local select = require('CopilotChat.select')
    return chat.ask(
        'Write commit message for the change with commitizen convention. Keep the title under 50 characters and wrap message at 72 characters. Format as a gitcommit code block.',
        {
            model = 'gpt-4.1',
            context = { 'git:staged' },
            selection = select.buffer,
        }
    )
end

local function refactor()
    local chat = require('CopilotChat')
    return chat.ask('Refactor the selected code', {
        model = 'gpt-4.1',
        selection = selection,
        context = { 'buffer' },
    })
end

local system_prompt = [[
Follow the user's instructions exactly.
Keep responses brief and impersonal.
Assume the user is on a %s machine; provide system-specific commands when relevant.
Code snippets may include line number prefixes—use these for reference, but omit them in output.

When presenting code changes:

1. For short edits (1-3 lines), add a header before the code block:
   [file:<file_name>](<file_path>) line:<start_line>-<end_line>

2. Then wrap the actual code in triple backticks with the appropriate language identifier.

3. For the specified lines, output the complete replacement code:
   - Match original indentation
   - Include all necessary lines (no omissions)
   - Exclude line number prefixes

4. For more extensive edits (more than 3 lines), output only the complete replacement code for the selected block, without the header.
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
        { '<leader>J', refactor, mode = { 'n', 'v' } },
        { 'gC', commit_message, mode = { 'n', 'v' } },
    },
    event = 'VeryLazy',
    config = {
        model = 'gpt-4.1',
        system_prompt = system_prompt,
        selection = selection,
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
