local function config()
    require('Comment').setup({
        toggler = {
            line = '<C-_>',
            block = '<leader><C-_>',
        },
        opleader = {
            line = '<C-_>',
            block = '<leader><C-_>',
        },
        ignore = '^$',
    })

    local api = require('Comment.api')
    local opts = { noremap = true, silent = true }
    vim.keymap.set('i', '<C-_>', api.toggle.linewise.current, opts)
end

return {
    'numToStr/Comment.nvim',
    config = config,
}
