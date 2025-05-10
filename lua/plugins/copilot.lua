local M = { 'zbirenbaum/copilot.lua' }

M.event = 'InsertEnter'

local opts = {
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
            accept = false,
            dismiss = '<C-q>',
            accept_word = '<C-a>',
            accept_line = '<C-e>',
            next = false,
            prev = false,
        },
    },
}

M.config = function()
    local copilot = require('copilot')
    local suggestion = require('copilot.suggestion')
    local api = vim.api

    copilot.setup(opts)
    local tab_key = api.nvim_replace_termcodes('<Tab>', true, false, true)

    local function supertab()
        if suggestion.is_visible() then
            suggestion.accept()
        else
            api.nvim_feedkeys(tab_key, 'n', false)
        end
    end

    vim.keymap.set('i', '<Tab>', supertab, { silent = true })
end

return M
