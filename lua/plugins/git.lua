local lazygit_config = function()
    vim.keymap.set({ 'n', 'v' }, '<leader>g', ':LazyGit<CR>', { silent = true })
    vim.g.lazygit_floating_window_scaling_factor = 1
end

local copilot_config = function()
    vim.g.copilot_enabled = true
    vim.g.copilot_filetypes = { markdown = true, gitcommit = true }
    vim.keymap.set('i', '<C-q>', '<Plug>(copilot-dismiss)')
end

return {
    {'github/copilot.vim', config = copilot_config },
    {'lewis6991/gitsigns.nvim', config = true },
    {
        'kdheepak/lazygit.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = lazygit_config,
    },
}
