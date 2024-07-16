return {
    'romainl/vim-cool',
    { 'Aasim-A/scrollEOF.nvim', config = true },
    {
        dir = '/home/rafael/projetos/run.nvim',
        config = function()
            require('run').setup()
            local run = require('run')
            local map = vim.keymap.set
            local modes = { 'n', 'v' }
            map(modes, '<leader>r', run.run)
            map(modes, '<leader>R', run.set_cmd)
        end,
    },
    { 'tzachar/highlight-undo.nvim', config = true },
}
