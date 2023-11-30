
-- Navigate vim panes better
vim.keymap.set({'n', 'v'}, "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set({'n', 'v'}, "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set({'n', 'v'}, "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set({'n', 'v'}, "<C-l>", "<C-w>l", { silent = true })
vim.keymap.set('i', "<C-h>", "<Esc><C-w>h", { silent = true })
vim.keymap.set('i', "<C-j>", "<Esc><C-w>j", { silent = true })
vim.keymap.set('i', "<C-k>", "<Esc><C-w>k", { silent = true })
vim.keymap.set('i', "<C-l>", "<Esc><C-w>l", { silent = true })

-- quit
vim.keymap.set({'n', 'v'}, '<leader>q', ':q<CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader>Q', ':qa<CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader>!', ':qa!<CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader>w', ':w<CR>', { silent = true })

-- visual block
vim.keymap.set({'n', 'v'}, '<leader>v', '<C-v>', { silent = true })

-- splits
vim.keymap.set({'n', 'v'}, '<leader>h', ':vnew<CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader>j', ':new<CR><C-w><C-r>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader>k', ':new<CR>', { silent = true })
vim.keymap.set({'n', 'v'}, '<leader>l', ':vnew<CR><C-w><C-r>', { silent = true })
-- resize
vim.keymap.set({'n', 'v'}, '<S-Left>', '<C-w>>', { silent = true })
vim.keymap.set({'n', 'v'}, '<S-Down>', '<C-w>-', { silent = true })
vim.keymap.set({'n', 'v'}, '<S-Up>', '<C-w>+', { silent = true })
vim.keymap.set({'n', 'v'}, '<S-Right>', '<C-w><', { silent = true })


-- maximize
vim.keymap.set({'n', 'v'}, '<leader>m', '<C-w>o', { silent = true })

-- file buffers
vim.keymap.set('n', '<leader>1', ':1tabnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>2', ':2tabnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>3', ':3tabnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>4', ':4tabnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>5', ':5tabnext<CR>', { silent = true })
vim.keymap.set('n', '<leader>6', ':6tabnext<CR>', { silent = true })

vim.keymap.set({'n', 'v'}, '<leader><tab>', '<C-^>', { silent = true })

-- commentary
vim.keymap.set('n', '<c-_>', ':Commentary<CR>', { silent = true })
vim.keymap.set('v', '<c-_>', ":'<,'>Commentary<CR>", { silent = true })
vim.keymap.set('i', '<c-_>', '<Esc>:Commentary<CR>', { silent = true })

-- move in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
-- move in normal mode
vim.keymap.set('n', 'J', ":m .+1<CR>==", { silent = true })
vim.keymap.set('n', 'K', ":m .-2<CR>==", { silent = true })
-- cursor in middle
vim.keymap.set('v', 'o', 'ozz', { silent = true })
vim.keymap.set({'n', 'v'}, 'G', 'Gzz', { silent = true })
vim.keymap.set({'n', 'v'}, 'n', 'nzz', { silent = true })
vim.keymap.set({'n', 'v'}, 'N', 'Nzz', { silent = true })

-- paste without losing register
vim.keymap.set({'n', 'v'}, 'p', '"0p', { silent = true })
-- paste and copy
vim.keymap.set({'n', 'v'}, '<leader>P', 'p', { silent = true })
-- paste from clipboard
vim.keymap.set({'n', 'v'}, '<leader>p', '\"+p', { silent = true })
-- yank to clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '\"+y', { silent = true })


-- select all
vim.keymap.set({'n', 'v'}, '<leader>a', 'ggVGzz', { silent = true })
vim.keymap.set('i', '<C-a>', '<Esc>ggVGzz', { silent = true })

-- search and replace
vim.keymap.set('n', '<leader>S', ':%s//<Left>', { silent = true })

-- exit terminal with ESC
vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
