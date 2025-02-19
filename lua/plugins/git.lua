vim.g.lazygit_floating_window_scaling_factor = 1
vim.env.GIT_EDITOR = "nvr --remote-tab-wait +'set bufhidden=delete'"

return {
    { 'lewis6991/gitsigns.nvim', config = true, event = 'BufReadPre' },
    {
        'kdheepak/lazygit.nvim',
        cmd = {
            'LazyGit',
            'LazyGitConfig',
            'LazyGitCurrentFile',
            'LazyGitFilter',
            'LazyGitFilterCurrentFile',
        },
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = { { '<leader>g', '<cmd>LazyGit<cr>', desc = 'LazyGit' } },
    },
    {
        'akinsho/git-conflict.nvim',
        version = '*',
        opts = { disable_diagnostics = true },
        event = 'VeryLazy',
    },
}
