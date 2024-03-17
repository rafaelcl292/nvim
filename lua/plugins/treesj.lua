local function config()
    local tsj = require('treesj')
    tsj.setup({
        use_default_keymaps = false,
        notify = false,
    })
    vim.keymap.set('n', '<leader>x', require('treesj').toggle)
end

return {
    'Wansmer/treesj',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = config,
}
