-- turn on highlight on yank
vim.cmd('au TextYankPost * lua vim.highlight.on_yank {}')

-- terminal settings
vim.cmd('au TermOpen * setlocal nonumber norelativenumber')
vim.cmd('au TermOpen * startinsert')
vim.cmd('au BufEnter * if &buftype == "terminal" | startinsert | endif')
vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
        local map = vim.api.nvim_buf_set_keymap
        map(0, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
    end,
})

-- remove auto comment
vim.cmd('au BufEnter * setlocal formatoptions-=cro')

-- quickfix keymaps
local function quickfix_keymaps()
    local map = vim.api.nvim_buf_set_keymap
    map(0, 'n', '<CR>', ':cclose<CR>', { noremap = true, silent = true })
    map(0, 'n', 'q', ':cclose<CR>', { noremap = true, silent = true })
    map(0, 'n', 'j', ':cn<CR><C-w><C-p>', { noremap = true, silent = true })
    map(0, 'n', 'k', ':cp<CR><C-w><C-p>', { noremap = true, silent = true })
    map(0, 'n', 'gg', ':cfir<CR><C-w><C-p>', { noremap = true, silent = true })
    map(0, 'n', 'G', ':clast<CR><C-w><C-p>', { noremap = true, silent = true })
end

vim.api.nvim_create_autocmd('FileType', {
    pattern = 'qf',
    callback = quickfix_keymaps,
})

-- intro
local function display_intro(payload)
    local is_dir = vim.fn.isdirectory(payload.file) == 1
    local default_buff = vim.api.nvim_get_current_buf()
    local default_buff_name = vim.api.nvim_buf_get_name(default_buff)
    if not is_dir and default_buff_name ~= '' then return end

    local intro_buff = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = intro_buff })

    vim.api.nvim_set_current_buf(intro_buff)
    vim.api.nvim_buf_delete(default_buff, { force = true })
end

local autocmd_group = vim.api.nvim_create_augroup('intro', {})
vim.api.nvim_create_autocmd('VimEnter', {
    group = autocmd_group,
    callback = display_intro,
    once = true,
})
