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

vim.keymap.set({'n', 'v'}, '<leader>fa', builtin.find_files, {})
vim.keymap.set({'n', 'v'}, '<leader>fr', builtin.git_files, {})
vim.keymap.set({'n', 'v'}, '<leader>fh', builtin.help_tags, {})
vim.keymap.set({'n', 'v'}, '<leader>fo', builtin.oldfiles, {})
vim.keymap.set({'n', 'v'}, '<leader>fg', builtin.live_grep, {})
vim.keymap.set({'n', 'v'}, '<leader>fb', builtin.buffers, {})
vim.keymap.set({'n', 'v'}, '<leader>fs', builtin.grep_string, {})
