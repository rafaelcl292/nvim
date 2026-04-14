vim.env.GIT_EDITOR = "nvr --remote-tab-wait +'set bufhidden=delete'"

return {
    { 'lewis6991/gitsigns.nvim', config = true, event = 'BufReadPre' },
}
