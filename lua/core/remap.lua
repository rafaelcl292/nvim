local function bind(key, cmd, mode, opts)
    if opts == nil then opts = { noremap = true, silent = true } end
    if mode == nil then mode = { 'n', 'v' } end
    vim.keymap.set(mode, key, cmd, opts)
end

-- quit
bind('\x17<C-q>', ':q!<CR>')
bind('\x17q', ':q!<CR>')
bind('\x17Q', ':qa!<CR>')

-- write
bind('<leader>w', ':w<CR>')

-- visual block
bind('<leader>v', '<C-v>')
bind('<C-q>', '')

-- terminal
bind('<leader>t', function()
    vim.cmd('new')
    vim.cmd('wincmd J')
    vim.cmd('horizontal resize ' .. math.floor(vim.o.lines * 0.30))
    vim.cmd('terminal ')
end)
bind('<leader>T', function()
    vim.cmd('vnew')
    vim.cmd('terminal')
    vim.cmd('vertical resize ' .. math.floor(vim.o.columns * 0.33))
end)
bind('<C-q>', [[<C-\><C-n>]], 't')
bind('<C-d>', [[<C-\><C-n>:bd!<CR>]], 't')

-- command mode
bind('<C-a>', '<Home>', 'c', { noremap = true })

-- previous file
bind('<leader><Tab>', '<C-^>')

-- move
bind('J', [[:<c-u>silent! '<,'> m '>+1<CR>gv=gv]], 'v')
bind('K', [[:<c-u>silent! '<,'> m '<-2<CR>gv=gv]], 'v')
bind('J', [[:silent!m .+1<CR>==]], 'n')
bind('K', [[:silent!m .-2<CR>==]], 'n')

-- cursor in middle
bind('<leader>z', 'zz')
bind('<C-u>', '<C-u>zz')
bind('<C-d>', '<C-d>zz')
bind('n', 'nzz')
bind('N', 'Nzz')

-- clipboard paste and yank
bind('<leader>p', '"+p')
bind('<leader>P', '"+P')
bind('<leader>y', '"+y')
bind('<leader>Y', '"+y$')

-- select all
bind('<leader>A', '<Esc>ggVGzz')

-- search and replace
bind('<leader>S', ':%s//g<Left><Left>', 'n', { noremap = true })
bind('<leader>S', ":'<,'>s//g<Left><Left>", 'v', { noremap = true })

-- fzf session
bind('<C-f>', function()
    -- check if in tmux
    if vim.fn.exists('$TMUX') then
        vim.cmd('silent !tmux new-window -n fzf')
        vim.cmd('silent !tmux send-keys -t fzf "fzf_session && exit" Enter')
    end
end)

-- search without smartcase
bind('<leader>/', [[/\C]], 'n', { noremap = true })

bind('<', '<gv', 'v')
bind('>', '>gv', 'v')

-- brackets
local get_files = function(dir)
    local entries = vim.fn.split(vim.fn.glob(dir .. '/*'), '\n')
    local files = {}
    for _, entry in pairs(entries) do
        if vim.fn.isdirectory(entry) ~= 1 then
            table.insert(files, vim.fn.fnamemodify(entry, ':t'))
        end
    end
    if vim.tbl_isempty(files) then
        return
    else
        return files
    end
end

local file_by_offset = function(offset)
    local dir = vim.fn.expand('%:p:h')
    local files = get_files(dir)
    if not files then return end
    local current = vim.fn.expand('%:t')
    if current == '' then
        if offset < 0 then
            return dir .. '/' .. files[1]
        else
            return dir .. '/' .. files[#files]
        end
    else
        local index = vim.fn.index(files, current) + 1
        if index == 0 then return end
        index = index + offset
        if index < 1 then
            index = 1
        elseif index > #files then
            index = #files
        end
        return dir .. '/' .. files[index]
    end
end

local function file_next()
    local file = file_by_offset(vim.v.count1)
    if file then vim.cmd('edit ' .. file) end
end

local function file_previous()
    local file = file_by_offset(-vim.v.count1)
    if file then vim.cmd('edit ' .. file) end
end

bind(']<Space>', 'o<Esc>k', 'n')
bind('[<Space>', 'O<Esc>j', 'n')
bind(']y', 'yyp', 'n')
bind('[y', 'yyP', 'n')
bind(']b', ':bnext<CR>')
bind('[b', ':bprevious<CR>')
bind(']t', ':tabnext<CR>')
bind('[t', ':tabprevious<CR>')
bind(']f', file_next)
bind('[f', file_previous)
bind(']g', ':Gitsigns next_hunk<CR>')
bind('[g', ':Gitsigns prev_hunk<CR>')

-- toggle colorcolumn=80
bind('<leader>?', function()
    if vim.o.colorcolumn == '80' then
        vim.cmd('set colorcolumn=')
        return
    end
    vim.cmd('set colorcolumn=80')
end)
