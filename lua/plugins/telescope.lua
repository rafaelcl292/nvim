local function clear_line()
    local api = vim.api
    local replace_termcodes = api.nvim_replace_termcodes
    api.nvim_feedkeys(replace_termcodes('<C-u>', true, true, true), 'n', true)
end

local config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    local builtin = require('telescope.builtin')

    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ['<esc>'] = actions.close,
                    ['<C-j>'] = actions.move_selection_next,
                    ['<C-k>'] = actions.move_selection_previous,
                    ['<C-u>'] = clear_line,
                },
            },
        },
    })
    telescope.load_extension('fzf')
    telescope.load_extension('ui-select')

    local map = vim.keymap.set
    map({ 'n', 'v' }, '<leader>fa', builtin.find_files)
    map({ 'n', 'v' }, '<leader>fg', builtin.git_files)
    map({ 'n', 'v' }, '<leader>fh', builtin.help_tags)
    map({ 'n', 'v' }, '<leader>fo', builtin.oldfiles)
    map({ 'n', 'v' }, '<leader>fs', builtin.live_grep)
    map({ 'n', 'v' }, '<leader>fb', builtin.buffers)
    map({ 'n', 'v' }, '<leader>fc', builtin.commands)
    map({ 'n', 'v' }, '<leader>fk', builtin.keymaps)
    map({ 'n', 'v' }, '<leader>fD', builtin.diagnostics)
    map({ 'n', 'v' }, '<leader>f;', builtin.command_history)
    map({ 'n', 'v' }, '<leader>fr', builtin.lsp_references)
    map({ 'n', 'v' }, '<leader>fd', function()
        local sorter = require('telescope.sorters').get_generic_fuzzy_sorter()
        local cmd = { 'fdfind', '--type', 'd' }
        local finder = require('telescope.finders').new_oneshot_job(cmd, {})
        require('telescope.pickers')
            .new({}, {
                prompt_title = 'Find Directory',
                sorter = sorter,
                finder = finder,
            })
            :find()
        vim.api.nvim_feedkeys('./', 'n', true)
    end, { desc = 'Find Directory' })
    map(
        { 'n', 'v' },
        '<leader>f.',
        function()
            builtin.current_buffer_fuzzy_find(
                require('telescope.themes').get_dropdown({
                    previewer = false,
                })
            )
        end,
        { desc = 'Search in current buffer' }
    )
end

return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope-ui-select.nvim',
    },
    config = config,
}
