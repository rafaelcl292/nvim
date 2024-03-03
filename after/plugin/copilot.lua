vim.g.copilot_enabled = true
vim.g.copilot_filetypes = { markdown = true, gitcommit = true }
vim.keymap.set('i', '<C-q>', '<Plug>(copilot-dismiss)')
