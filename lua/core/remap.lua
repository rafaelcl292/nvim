-- quit
vim.keymap.set({ 'n', 'v' }, '<leader>q', ':q!<CR>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>Q', ':qa!<CR>', { silent = true })

-- write
vim.keymap.set({ 'n', 'v' }, '<leader>w', ':w<CR>', { silent = true })

-- visual block
vim.keymap.set({ 'n', 'v' }, '<leader>v', '<C-v>', { silent = true })

-- maximize
vim.keymap.set({ 'n', 'v' }, '<leader>m', '<C-w>o', { silent = true })

-- terminal
vim.keymap.set({ 'n', 'v' }, '<leader>t', function()
    vim.cmd('new')
    vim.cmd('wincmd J')
    vim.cmd('horizontal resize ' .. math.floor(vim.o.lines * 0.33))
    vim.cmd('terminal ')
end, { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>T', function()
    vim.cmd('vnew')
    vim.cmd('terminal')
    vim.cmd('vertical resize ' .. math.floor(vim.o.columns * 0.33))
end, { silent = true })
vim.keymap.set('t', [[<C-\>]], [[<C-\><C-n>]], { silent = true })

-- previous file
vim.keymap.set({ 'n', 'v' }, '<leader><Tab>', '<C-^>', { silent = true })

-- commentary
vim.keymap.set('n', '<C-_>', ':Commentary<CR>', { silent = true })
vim.keymap.set('v', '<C-_>', ":'<,'>Commentary<CR>", { silent = true })
vim.keymap.set('i', '<C-_>', '<Esc>:Commentary<CR>', { silent = true })

-- move
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { silent = true })
vim.keymap.set('n', 'J', ':m .+1<CR>==', { silent = true })
vim.keymap.set('n', 'K', ':m .-2<CR>==', { silent = true })

-- cursor in middle
vim.keymap.set({ 'n', 'v' }, 'G', 'Gzz', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<leader>z', 'zz', { silent = true })

-- paste without losing register
vim.keymap.set('v', 'p', '"0p', { silent = true })
-- paste and copy
vim.keymap.set({ 'n', 'v' }, '<leader>P', 'p', { silent = true })
-- paste from clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p', { silent = true })
-- yank to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y', { silent = true })

-- select all
vim.keymap.set({ 'n', 'v' }, '<leader>a', 'ggVGzz', { silent = true })
vim.keymap.set('i', '<C-a>', '<Esc>ggVGzz', { silent = true })

-- search and replace
vim.keymap.set('n', '<leader>S', ':%s//g<Left><Left>')
-- within visual selection
vim.keymap.set('v', '<leader>S', ':s//g<Left><Left>')

-- fzf session
vim.keymap.set({ 'n', 'v', 'i', 'c' }, '<C-f>', function()
    -- check if in tmux
    if vim.fn.exists('$TMUX') then
        vim.cmd('silent !tmux new-window -n fzf')
        vim.cmd('silent !tmux send-keys -t fzf "fzf_session && exit" Enter')
    end
end, { silent = true })

-- search without smartcase
vim.keymap.set('n', '<leader>/', [[/\C]])

-- undo
vim.keymap.set({ 'n', 'v' }, 'u', ':silent undo<CR>', { silent = true })

vim.keymap.set('n', ']<Space>', 'o<Esc>k', { silent = true })
vim.keymap.set('n', '[<Space>', 'O<Esc>j', { silent = true })
vim.keymap.set('n', ']y', 'yyp', { silent = true })
vim.keymap.set('n', '[y', 'yyP', { silent = true })
-- vim.keymap.set('v', 'd', [[:<C-u>silent'<,'>delete<CR>]], { silent = true })
-- vim.keymap.set('v', 'D', [[:<C-u>silent'<,'>delete<CR>]], { silent = true })
