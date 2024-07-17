vim.g.lazygit_floating_window_scaling_factor = 1
vim.g.copilot_enabled = true
vim.g.copilot_filetypes = {
    markdown = true,
    gitcommit = true,
    text = true,
    [''] = true,
}

local function copilot_toggle()
    if vim.g.copilot_enabled then
        vim.cmd('Copilot disable')
        print('Copilot disabled')
        vim.g.copilot_enabled = false
    else
        vim.cmd('Copilot enable')
        print('Copilot enabled')
        vim.g.copilot_enabled = true
    end
end

return {
    {
        'github/copilot.vim',
        event = 'BufReadPre',
        keys = {
            { '<C-q>', '<Plug>(copilot-dismiss)', mode = 'i' },
            { '<C-e>', '<Plug>(copilot-accept-line)', mode = 'i' },
            { '<C-a>', '<Plug>(copilot-accept-word)', mode = 'i' },
            { '<C-s>', '<Plug>(copilot-suggest)', mode = 'i' },
            { '<leader>c', copilot_toggle },
        },
    },
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
}
