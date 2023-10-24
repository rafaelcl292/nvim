vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- wsl clipboard
vim.g.clipboard = {
    name = 'WslClipboard',
    copy = {
        ['+'] = 'clip.exe',
        ['*'] = 'clip.exe',
    },
    paste = {
        ['+'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        ['*'] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
    },
    cache_enabled = 0
}

-- vim.opt.scrolloff = 10
-- vim.opt.scrolloff = 999
vim.opt.scrolloff = 0

vim.opt.whichwrap = 'b,s,<,>,[,],h,l'
vim.opt.wrap = false

vim.opt.signcolumn = 'yes'

vim.opt.autowriteall = true

vim.opt.cursorline = true

vim.opt.autoindent = true

-- vim.opt.colorcolumn = '80'

-- turn on highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {}'

vim.g.mapleader = " "

-- disable mouse
-- vim.opt.mouse = ''

