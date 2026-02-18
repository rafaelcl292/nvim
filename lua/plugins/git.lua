return {
    { 'lewis6991/gitsigns.nvim', config = true, event = 'BufReadPre' },
    {
        'akinsho/git-conflict.nvim',
        version = '*',
        opts = { disable_diagnostics = true },
        event = 'VeryLazy',
    },
}
