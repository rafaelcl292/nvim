-- turn on highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {}'

-- terminal settings
vim.cmd 'au TermOpen * setlocal nonumber norelativenumber'
vim.cmd 'au TermOpen * startinsert'
