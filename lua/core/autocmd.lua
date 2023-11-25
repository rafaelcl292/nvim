-- turn on highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {}'

-- turn off line numbers in terminal windows
vim.cmd 'au TermOpen * setlocal nonumber norelativenumber'
