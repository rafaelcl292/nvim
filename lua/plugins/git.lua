local lazygit_config = function()
    local modes = { 'n', 'v' }
    local opts = { noremap = true, silent = true }
    vim.keymap.set(modes, '<leader>g', ':LazyGit<CR>', opts)
    vim.g.lazygit_floating_window_scaling_factor = 1
end

local copilot_config = function()
    vim.g.copilot_enabled = false
    vim.g.copilot_filetypes =
        { markdown = true, gitcommit = true, text = true, [''] = true }
    vim.keymap.set('i', '<C-q>', '<Plug>(copilot-dismiss)')
    vim.keymap.set('i', '<C-e>', '<Plug>(copilot-accept-line)')
    vim.keymap.set('i', '<C-a>', '<Plug>(copilot-accept-word)')
    vim.keymap.set('i', '<C-s>', '<Plug>(copilot-suggest)')
    vim.keymap.set('n', '<leader>c', function()
        if vim.g.copilot_enabled then
            vim.cmd('Copilot disable')
            print('Copilot disabled')
            vim.g.copilot_enabled = false
        else
            vim.cmd('Copilot enable')
            print('Copilot enabled')
            vim.g.copilot_enabled = true
        end
    end)
end

return {
    { 'github/copilot.vim', config = copilot_config },
    { 'lewis6991/gitsigns.nvim', config = true },
    {
        'kdheepak/lazygit.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
        config = lazygit_config,
    },
}
