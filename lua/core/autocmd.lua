-- turn on highlight on yank
vim.cmd 'au TextYankPost * lua vim.highlight.on_yank {}'

-- terminal settings
vim.cmd 'au TermOpen * setlocal nonumber norelativenumber'
vim.cmd 'au TermOpen * startinsert'

-- clear command line
function Clear_command_line()
    vim.fn.timer_start(5000, function()
        print(" ")
    end)
end
vim.cmd 'au CmdlineLeave * lua Clear_command_line()'
