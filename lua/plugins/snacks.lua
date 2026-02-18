local function find_dirs()
    Snacks.picker.pick({
        source = 'files',
        finder = function(_, ctx)
            local cwd = vim.fs.normalize(vim.uv.cwd() or '.')
            return require('snacks.picker.source.proc').proc(
                ctx:opts({
                    cmd = 'fdfind',
                    args = { '--type', 'd', '--color', 'never', '-E', '.git' },
                    transform = function(item)
                        item.cwd = cwd
                        item.file = item.text
                        item.dir = true
                    end,
                }),
                ctx
            )
        end,
        title = 'Find Directories',
        actions = {
            confirm = function(picker, item)
                picker:close()
                if item then
                    local path = item.file:sub(1, 1) == '/' and item.file
                        or (vim.fs.normalize(vim.uv.cwd() or '.') .. '/' .. item.file)
                    require('oil').open(path)
                end
            end,
        },
    })
end

local function lazygit() Snacks.lazygit() end

local M = { 'folke/snacks.nvim' }

M.priority = 1000
M.lazy = false

---@type snacks.Config
M.opts = {
    input = { enabled = true },
    notifier = { enabled = false },
    picker = {
        enabled = true,
        win = {
            input = {
                keys = {
                    ['<Esc>'] = { 'close', mode = { 'i', 'n' } },
                    ['<C-j>'] = { 'preview_scroll_down', mode = { 'i', 'n' } },
                    ['<C-k>'] = { 'preview_scroll_up', mode = { 'i', 'n' } },
                },
            },
            list = {
                keys = {
                    ['<C-j>'] = 'preview_scroll_down',
                    ['<C-k>'] = 'preview_scroll_up',
                },
            },
        },
    },
    lazygit = { win = { width = 0, height = 0 } },
    quickfile = { enabled = true },
    words = { enabled = true },
}

M.keys = {
    { '<leader>fd', find_dirs, desc = 'Find directories' },
    { '<leader>fh', function() Snacks.picker.help() end, desc = 'Help pages' },
    { '<leader>fo', function() Snacks.picker.recent() end, desc = 'Recent files' },
    { '<leader>fb', function() Snacks.picker.buffers() end, desc = 'Buffers' },
    { '<leader>fc', function() Snacks.picker.commands() end, desc = 'Commands' },
    { '<leader>fk', function() Snacks.picker.keymaps() end, desc = 'Keymaps' },
    { '<leader>fD', function() Snacks.picker.diagnostics() end, desc = 'Diagnostics' },
    {
        '<leader>f:',
        function() Snacks.picker.command_history() end,
        desc = 'Command history',
    },
    {
        '<leader>fr',
        function() Snacks.picker.lsp_references() end,
        desc = 'LSP references',
    },
    { '<leader>f.', function() Snacks.picker.lines() end, desc = 'Buffer lines' },
    { '<leader>fu', function() Snacks.picker.undo() end, desc = 'Undo history' },
    { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto definition' },
    {
        'gR',
        function() Snacks.picker.lsp_references() end,
        desc = 'LSP references',
        nowait = true,
    },

    { '<leader>g', lazygit, desc = 'LazyGit' },
    { '<leader>b', function() Snacks.picker.git_branches() end, desc = 'Git Branches' },
    { '<leader>a', function() Snacks.picker.git_status() end, desc = 'Git Status' },
    { '<leader>+', function() Snacks.picker.git_stash() end, desc = 'Git Stash' },
    { '<leader>l', function() Snacks.picker.git_log() end, desc = 'Git Log' },
}

return M
