local function toggle_supermaven()
    local api = require('supermaven-nvim.api')
    api.toggle()
    if api.is_running() then
        vim.notify('Supermaven is running')
    else
        vim.notify('Supermaven is not running')
    end
end

return {
    'supermaven-inc/supermaven-nvim',
    opts = {
        keymaps = {
            accept_suggestion = '<Tab>',
            clear_suggestion = '<C-q>',
            accept_word = '<C-a>',
        },
        log_level = 'off',
    },
    keys = {
        { '<leader>c', toggle_supermaven },
    },
    event = 'VeryLazy',
}
