local splits = require('smart-splits')

-- splits
vim.keymap.set({ 'n', 'v' }, '<leader>h', function()
    vim.cmd('vnew')
    splits.swap_buf_right()
    vim.cmd('wincmd p')
end, { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>j', function()
    vim.cmd('new')
    splits.swap_buf_down()
    vim.cmd('wincmd p')
end, { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>k', ':new<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>l', ':vnew<CR>', { silent = true })

-- resize
vim.keymap.set({ 'n', 'v', 't' }, '<A-h>', splits.resize_left)
vim.keymap.set({ 'n', 'v', 't' }, '<A-j>', splits.resize_down)
vim.keymap.set({ 'n', 'v', 't' }, '<A-k>', splits.resize_up)
vim.keymap.set({ 'n', 'v', 't' }, '<A-l>', splits.resize_right)

-- swaps
vim.keymap.set('n', '<leader>H', splits.swap_buf_left)
vim.keymap.set('n', '<leader>J', splits.swap_buf_down)
vim.keymap.set('n', '<leader>K', splits.swap_buf_up)
vim.keymap.set('n', '<leader>L', splits.swap_buf_right)
