require("toggleterm").setup {
    -- persist_mode = false,
}

-- exit terminal with ESC
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })

-- togle terminal hoziontally
vim.keymap.set('n', '<leader>t', ':ToggleTerm direction=horizontal size=14<CR>', { noremap = true })

-- togle terminal vertically
vim.keymap.set('n', '<leader>T', ':ToggleTerm direction=vertical size=40<CR>', { noremap = true })

-- new horizontal terminal
vim.keymap.set('n', '<leader>nt',
    function()
        require("toggleterm.terminal").Terminal:new {
            size = 14,
            direction = "horizontal",
        }:toggle()
    end, { noremap = true }
)

-- new vertical terminal
vim.keymap.set('n', '<leader>nT',
    function()
        require("toggleterm.terminal").Terminal:new {
            size = 40,
            direction = "vertical",
        }:toggle()
    end, { noremap = true }
)


