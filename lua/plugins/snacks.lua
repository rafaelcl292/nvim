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
local function help() Snacks.picker.help() end
local function recent() Snacks.picker.recent() end
local function buffers() Snacks.picker.buffers() end
local function commands() Snacks.picker.commands() end
local function keymaps() Snacks.picker.keymaps() end
local function diagnostics() Snacks.picker.diagnostics() end
local function command_history() Snacks.picker.command_history() end
local function lsp_references() Snacks.picker.lsp_references() end
local function lines() Snacks.picker.lines() end
local function undo() Snacks.picker.undo() end
local function lsp_definitions() Snacks.picker.lsp_definitions() end
local function lazygit() Snacks.lazygit() end
local function git_branches() Snacks.picker.git_branches() end
local function git_status() Snacks.picker.git_status() end
local function git_stash() Snacks.picker.git_stash() end
local function git_log() Snacks.picker.git_log() end

return {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
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
    },
    keys = {
        { '<leader>fd', find_dirs, desc = 'Find directories' },
        { '<leader>fh', help, desc = 'Help pages' },
        { '<leader>fo', recent, desc = 'Recent files' },
        { '<leader>fb', buffers, desc = 'Buffers' },
        { '<leader>fc', commands, desc = 'Commands' },
        { '<leader>fk', keymaps, desc = 'Keymaps' },
        { '<leader>fD', diagnostics, desc = 'Diagnostics' },
        { '<leader>f:', command_history, desc = 'Command history' },
        { '<leader>fr', lsp_references, desc = 'LSP references' },
        { '<leader>f.', lines, desc = 'Buffer lines' },
        { '<leader>fu', undo, desc = 'Undo history' },
        { 'gd', lsp_definitions, desc = 'Goto definition' },
        { 'gR', lsp_references, desc = 'LSP references', nowait = true },

        -- git
        { '<leader>g', lazygit, desc = 'LazyGit' },
        { '<leader>b', git_branches, desc = 'Git Branches' },
        { '<leader>a', git_status, desc = 'Git Status' },
        { '<leader>+', git_stash, desc = 'Git Stash' },
        { '<leader>l', git_log, desc = 'Git Log' },
    },
}
