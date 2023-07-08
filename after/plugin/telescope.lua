local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>r', builtin.git_files, {})
vim.keymap.set('n', '<leader>H', builtin.help_tags, {})
vim.keymap.set('n', '<leader>o', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>g', builtin.live_grep, {})

