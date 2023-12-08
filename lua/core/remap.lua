-- Navigate vim panes better
vim.keymap.set({ 'n', 'v' }, "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set({ 'n', 'v' }, "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set({ 'n', 'v' }, "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set({ 'n', 'v' }, "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set('i', "<C-h>", "<Esc><C-w>h", { silent = true })
vim.keymap.set('i', "<C-j>", "<Esc><C-w>j", { silent = true })
vim.keymap.set('i', "<C-k>", "<Esc><C-w>k", { silent = true })
vim.keymap.set('i', "<C-l>", "<Esc><C-w>l", { silent = true })
vim.keymap.set('t', "<C-h>", "<C-\\><C-n><C-w>h", { silent = true })
vim.keymap.set('t', "<C-j>", "<C-\\><C-n><C-w>j", { silent = true })
vim.keymap.set('t', "<C-k>", "<C-\\><C-n><C-w>k", { silent = true })
vim.keymap.set('t', "<C-_>", "<C-\\><C-n><C-w>l", { silent = true })

-- quit
vim.keymap.set({ 'n', 'v' }, '<leader>q', ':q<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>Q', ':qa<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>!', ':qa!<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>w', ':w<CR>', { silent = true })

-- visual block
vim.keymap.set({ 'n', 'v' }, '<leader>v', '<C-v>', { silent = true })

-- splits
vim.keymap.set({ 'n', 'v' }, '<leader>h', ':vnew<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>j', ':new<CR><C-w><C-r>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>k', ':new<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>l', ':vnew<CR><C-w><C-r>', { silent = true })
-- splits with resize
vim.keymap.set({ 'n', 'v' }, '<leader>H', '0:vnew<CR>:vertical resize -30<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>J', '0:new<CR><C-w><C-r>:resize -8<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>K', '0:new<CR>:resize -8<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>L', '0:vnew<CR><C-w><C-r>:vertical resize -30<CR>', { silent = true })

-- resize
vim.keymap.set({ 'n', 'v' }, '<Left>', ':vertical resize -3<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<Down>', ':resize +3<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<Up>', ':resize -3<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<Right>', ':vertical resize +3<CR>', { silent = true })


-- maximize
vim.keymap.set({ 'n', 'v' }, '<leader>m', '<C-w>o', { silent = true })

-- terminal
vim.keymap.set({ 'n', 'v' }, '<leader>t', ':terminal<CR>', { silent = true })

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
vim.keymap.set('n', '<leader>S', ':%s//<Left>', { silent = true })

-- exit terminal with ESC
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
