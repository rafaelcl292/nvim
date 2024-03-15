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
end

return {
    'numToStr/Comment.nvim',
    config = config,
}
