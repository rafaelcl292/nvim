vim.keymap.set("n", "<leader>;", vim.cmd.noh)

-- Navigate vim panes better
vim.keymap.set('i', '<c-k>', '<Esc>:TmuxNavigateUp<CR>', { silent = true })
vim.keymap.set('i', '<c-j>', '<Esc>:TmuxNavigateDown<CR>', { silent = true })
vim.keymap.set('i', '<c-h>', '<Esc>:TmuxNavigateLeft<CR>', { silent = true })
vim.keymap.set('i', '<c-l>', '<Esc>:TmuxNavigateRight<CR>', { silent = true })

-- quit
vim.keymap.set('n', '<leader>q', ':q<CR>', { silent = true })
vim.keymap.set('n', '<leader>Q', ':qa<CR>', { silent = true })

-- visual block
vim.keymap.set('n', '<leader>v', '<C-v>', { silent = true })

-- splits
vim.keymap.set('n', '<leader>h', ':vsp<CR>', { silent = true })
vim.keymap.set('n', '<leader>j', ':sp<CR>:wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<leader>k', ':sp<CR>', { silent = true })
vim.keymap.set('n', '<leader>l', ':vsp<CR>:wincmd l<CR>', { silent = true })

-- maximize
vim.keymap.set('n', '<leader>m', '<C-w>T', { silent = true })

-- file buffers
vim.keymap.set('n', '<leader>n', '<C-PageDown>', { silent = true })
vim.keymap.set('n', '<leader>p', '<C-PageUp>', { silent = true })
vim.keymap.set('n', '<leader>t', ':tabnew<CR>', { silent = true })

--- explorer
vim.keymap.set('n', '<leader>e', ':Ex<CR>', { silent = true })

-- commentary
vim.keymap.set('n', '<c-_>', ':Commentary<CR>', { silent = true })
vim.keymap.set('v', '<c-_>', ":'<,'>Commentary<CR>", { silent = true })

