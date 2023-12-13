local splits = require('smart-splits')

-- navigation
vim.keymap.set({ 'n', 'v', 'i', 't' }, '<C-h>', function()
    splits.move_cursor_left({ at_edge = 'stop' })
end, { silent = true })
vim.keymap.set({ 'n', 'v', 'i', 't' }, '<C-j>', function()
    splits.move_cursor_down({ at_edge = 'stop' })
end, { silent = true })
vim.keymap.set({ 'n', 'v', 'i', 't' }, '<C-k>', function()
    splits.move_cursor_up({ at_edge = 'stop' })
end, { silent = true })
vim.keymap.set({ 'n', 'v', 'i' }, '<C-l>', function()
    splits.move_cursor_right({ at_edge = 'stop' })
end, { silent = true })


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

-- splits with resize

-- resize
vim.keymap.set({ 'n', 'v' }, '<Left>', splits.resize_left)
vim.keymap.set({ 'n', 'v' }, '<Down>', splits.resize_down)
vim.keymap.set({ 'n', 'v' }, '<Up>', splits.resize_up)
vim.keymap.set({ 'n', 'v' }, '<Right>', splits.resize_right)
vim.keymap.set({ 'n', 'v', 't' }, '<A-h>', splits.resize_left)
vim.keymap.set({ 'n', 'v', 't' }, '<A-j>', splits.resize_down)
vim.keymap.set({ 'n', 'v', 't' }, '<A-k>', splits.resize_up)
vim.keymap.set({ 'n', 'v', 't' }, '<A-l>', splits.resize_right)

-- swaps
vim.keymap.set('n', '<leader>H', splits.swap_buf_left)
vim.keymap.set('n', '<leader>J', splits.swap_buf_down)
vim.keymap.set('n', '<leader>K', splits.swap_buf_up)
vim.keymap.set('n', '<leader>L', splits.swap_buf_right)
