-- turn on highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {}'

-- terminal settings
vim.cmd 'au TermOpen * setlocal nonumber norelativenumber'
vim.cmd 'au TermOpen * startinsert'
vim.cmd 'au BufEnter * if &buftype == "terminal" | startinsert | endif'

-- clear command line
function Clear_command_line()
    vim.fn.timer_start(4000, function()
        print(" ")
    end)
end
vim.cmd 'au CmdlineLeave * lua Clear_command_line()'

-- remove auto comment
vim.cmd 'au BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o'
