-- quit
vim.keymap.set({ 'n', 'v' }, '<leader>q', ':q<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>Q', ':qa<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>!', ':qa!<CR>', { silent = true })

-- visual block
vim.keymap.set({ 'n', 'v' }, '<leader>v', '<C-v>', { silent = true })

-- maximize
vim.keymap.set({ 'n', 'v' }, '<leader>m', '<C-w>o', { silent = true })

-- terminal
vim.keymap.set({ 'n', 'v' }, '<leader>t', ':terminal<CR>', { silent = true })
-- terminal to the right
vim.keymap.set({ 'n', 'v' }, '<leader>T', function()
  vim.cmd('vnew')
  vim.cmd('terminal')
  -- resize according to the window size
  -- 30% of the window
  vim.cmd('vertical resize ' .. math.floor(vim.o.columns * 0.3))
end, { silent = true })

-- previous file
vim.keymap.set({ 'n', 'v' }, '<leader><Tab>', '<C-^>', { silent = true })

-- commentary
vim.keymap.set('n', '<C-_>', ':Commentary<CR>', { silent = true })
vim.keymap.set('v', '<C-_>', ":'<,'>Commentary<CR>", { silent = true })
vim.keymap.set('i', '<C-_>', '<Esc>:Commentary<CR>', { silent = true })

-- move in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
-- move in normal mode
vim.keymap.set('n', 'J', ":m .+1<CR>==", { silent = true })
vim.keymap.set('n', 'K', ":m .-2<CR>==", { silent = true })
-- cursor in middle
vim.keymap.set('v', 'o', 'ozz', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'G', 'Gzz', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'n', 'nzz', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'N', 'Nzz', { silent = true })

-- paste without losing register
vim.keymap.set('v', 'p', '"0p', { silent = true })
-- paste and copy
vim.keymap.set({ 'n', 'v' }, '<leader>P', 'p', { silent = true })
-- paste from clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>p', '\"+p', { silent = true })
-- yank to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '\"+y', { silent = true })


-- select all
vim.keymap.set({ 'n', 'v' }, '<leader>a', 'ggVGzz', { silent = true })
vim.keymap.set('i', '<C-a>', '<Esc>ggVGzz', { silent = true })

-- search and replace
vim.keymap.set('n', '<leader>S', ':%s//g<Left><Left>')
-- within visual selection
vim.keymap.set('v', '<leader>S', ':s//g<Left><Left>')


-- exit terminal with ESC
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
