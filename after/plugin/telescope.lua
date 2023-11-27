require('telescope').setup {
  defaults = {
      mappings = {
          i = {
              ["<esc>"] = require('telescope.actions').close,
          },
      },
  }
}

require 'telescope.builtin'

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>fa', builtin.find_files, {})
vim.keymap.set('n', '<leader>fr', builtin.git_files, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
