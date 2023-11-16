vim.keymap.set("n", "<leader>;", vim.cmd.noh)

-- Navigate vim panes better
vim.keymap.set('i', '<c-k>', '<Esc>:TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('i', '<c-j>', '<Esc>:TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('i', '<c-h>', '<Esc>:TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('i', '<c-l>', '<Esc>:TmuxNavigateRight<CR>', { silent = true })

-- quit
vim.keymap.set('n', '<leader>q', ':q<CR>', { silent = true })
vim.keymap.set('n', '<leader>Q', ':qa<CR>', { silent = true })
vim.keymap.set('n', '<leader>!', ':qa!<CR>', { silent = true })
vim.keymap.set('n', '<leader>w', ':w<CR>', { silent = true })

-- visual block
vim.keymap.set('n', '<leader>v', '<C-v>', { silent = true })

-- splits
vim.keymap.set('n', '<leader>h', ':vsp<CR>', { silent = true })
vim.keymap.set('n', '<leader>j', ':sp<CR>:wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<leader>k', ':sp<CR>', { silent = true })
vim.keymap.set('n', '<leader>l', ':vsp<CR>:wincmd l<CR>', { silent = true })

-- maximize
vim.keymap.set('n', '<leader>m', '<C-w>o', { silent = true })

-- file buffers
-- vim.keymap.set('n', '<leader>n', '<C-PageDown>', { silent = true })
-- vim.keymap.set('n', '<leader>p', '<C-PageUp>', { silent = true })
-- vim.keymap.set('n', '<leader>t', ':tabnew<CR>', { silent = true })
vim.keymap.set('n', '<leader><tab>', '<C-^>', { silent = true })

-- explorer
vim.keymap.set('n', '<leader>E', ':Ex<CR>', { silent = true })

-- commentary
vim.keymap.set('n', '<c-_>', ':Commentary<CR>', { silent = true })
vim.keymap.set('v', '<c-_>', ":'<,'>Commentary<CR>", { silent = true })
vim.keymap.set('i', '<c-_>', '<Esc>:Commentary<CR>', { silent = true })

-- undo tree
vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>', { silent = true })

-- move in visual mode
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })

-- cursor in middle
vim.keymap.set('n', '<leader>z', 'zz', { silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { silent = true })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { silent = true })
-- vim.keymap.set('n', 'n', 'nzz', { silent = true })
-- vim.keymap.set('n', 'N', 'Nzz', { silent = true })
-- vim.keymap.set('n', 'j', 'jzz', { silent = true })
-- vim.keymap.set('n', 'k', 'kzz', { silent = true })
-- vim.keymap.set('v', 'j', 'jzz', { silent = true })
-- vim.keymap.set('v', 'k', 'kzz', { silent = true })
vim.keymap.set('v', 'o', 'ozz', { silent = true })
vim.keymap.set('n', 'G', 'Gzz', { silent = true })
vim.keymap.set('n', '{', '{zz', { silent = true })
vim.keymap.set('n', '}', '}zz', { silent = true })

-- paste without losing register
vim.keymap.set('n', '<leader>P', '\"_dP', { silent = true })
vim.keymap.set('v', '<leader>P', '\"_dP', { silent = true })
-- paste from clipboard
vim.keymap.set('n', '<leader>p', '\"+p', { silent = true })
vim.keymap.set('v', '<leader>p', '\"+p', { silent = true })
-- yank to clipboard
vim.keymap.set('n', '<leader>y', '\"+y', { silent = true })
vim.keymap.set('v', '<leader>y', '\"+y', { silent = true })


-- select all
vim.keymap.set('n', '<leader>a', 'ggVGzz', { silent = true })
vim.keymap.set('v', '<leader>a', 'ggVGzz', { silent = true })
vim.keymap.set('i', '<C-a>', '<Esc>ggVGzz', { silent = true })

-- search and replace
vim.keymap.set('n', '<leader>S', ':%s//<Left>', { silent = true })
