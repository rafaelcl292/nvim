telescope = require('telescope')
local actions = require('telescope.actions')
telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    }
}

telescope.load_extension('fzf')
local builtin = require('telescope.builtin')

vim.keymap.set({ 'n', 'v' }, '<leader>fa', builtin.find_files)
vim.keymap.set({ 'n', 'v' }, '<leader>fr', builtin.git_files)
vim.keymap.set({ 'n', 'v' }, '<leader>fh', builtin.help_tags)
vim.keymap.set({ 'n', 'v' }, '<leader>fo', builtin.oldfiles)
vim.keymap.set({ 'n', 'v' }, '<leader>fs', builtin.live_grep)
vim.keymap.set({ 'n', 'v' }, '<leader>fb', builtin.buffers)
vim.keymap.set({ 'n', 'v' }, '<leader>fc', builtin.commands)
vim.keymap.set({ 'n', 'v' }, '<leader>fd', function()
    local find_command = { 'fdfind', '--type', 'd' }
    require('telescope.pickers').new({}, {
        prompt_title = 'Find Directory',
        finder = require('telescope.finders')
            .new_oneshot_job(find_command),
        sorter = require('telescope.sorters')
            .get_generic_fuzzy_sorter(),
    }):find()
end, {})
vim.keymap.set({ 'n', 'v' }, '<leader>f;', ':Noice telescope<CR>')
vim.keymap.set({ 'n', 'v' }, '<leader>fg', telescope.extensions.lazygit.lazygit)
