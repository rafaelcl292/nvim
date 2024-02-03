vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 6

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.whichwrap = 'b,s,<,>,[,]'
vim.opt.wrap = true

vim.opt.signcolumn = 'yes'

vim.opt.autowriteall = true

vim.opt.cursorline = true

vim.opt.autoindent = true

vim.opt.laststatus = 3

vim.opt.colorcolumn = '80'
vim.opt.splitright = true

vim.opt.ignorecase = true

vim.opt.pumheight = 5

vim.opt.timeout = false

vim.opt.report = 100

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
    cache_enabled = 0,
}

vim.g.zig_fmt_autosave = 0

-- leader key
vim.g.mapleader = ' '
