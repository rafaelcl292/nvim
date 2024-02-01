require('nvim-treesitter.configs').setup({
    ensure_installed = {
        'vim',
        'bash',
        'markdown',
        'markdown_inline',
        'c',
        'cpp',
        'css',
        'dockerfile',
        'go',
        'gomod',
        'html',
        'java',
        'javascript',
        'json',
        'jsonc',
        'lua',
        'python',
        'regex',
        'rust',
        'toml',
        'typescript',
        'yaml',
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    autotag = {
        enable = true,
    },

    textobjects = {
        move = {
            enable = true,
            set_jumps = false,
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer',
                [']o'] = '@loop.*',
                [']i'] = '@conditional.outer',
                [']a'] = '@parameter.outer',
                [']c'] = '@comment.outer',
                [']r'] = '@return.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
                [']O'] = '@loop.*',
                [']I'] = '@conditional.outer',
                [']A'] = '@parameter.outer',
                [']C'] = '@comment.outer',
                [']R'] = '@return.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
                ['[o'] = '@loop.*',
                ['[i'] = '@conditional.outer',
                ['[a'] = '@parameter.outer',
                ['[c'] = '@comment.outer',
                ['[r'] = '@return.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
                ['[O'] = '@loop.*',
                ['[I'] = '@conditional.outer',
                ['[A'] = '@parameter.outer',
                ['[C'] = '@comment.outer',
                ['[R'] = '@return.outer',
            },
        },
    },
})

local ts_repeat_move = require('nvim-treesitter.textobjects.repeatable_move')

-- Repeat movement with ; and ,
vim.keymap.set({ 'n', 'x', 'o' }, ';', ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ 'n', 'x', 'o' }, ',', ts_repeat_move.repeat_last_move_previous)

-- make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ 'n', 'x', 'o' }, 'f', ts_repeat_move.builtin_f)
vim.keymap.set({ 'n', 'x', 'o' }, 'F', ts_repeat_move.builtin_F)
vim.keymap.set({ 'n', 'x', 'o' }, 't', ts_repeat_move.builtin_t)
vim.keymap.set({ 'n', 'x', 'o' }, 'T', ts_repeat_move.builtin_T)
