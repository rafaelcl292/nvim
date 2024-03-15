local opts = {
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
                [']l'] = '@loop.*',
                [']i'] = '@conditional.outer',
                [']a'] = '@parameter.outer',
                [']c'] = '@comment.outer',
                [']r'] = '@return.outer',
                [']}'] = '@block.outer',
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer',
                [']L'] = '@loop.*',
                [']I'] = '@conditional.outer',
                [']A'] = '@parameter.outer',
                [']C'] = '@comment.outer',
                [']R'] = '@return.outer',
                [']{'] = '@block.outer',
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer',
                ['[l'] = '@loop.*',
                ['[i'] = '@conditional.outer',
                ['[a'] = '@parameter.outer',
                ['[c'] = '@comment.outer',
                ['[r'] = '@return.outer',
                ['[{'] = '@block.outer',
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer',
                ['[L'] = '@loop.*',
                ['[I'] = '@conditional.outer',
                ['[A'] = '@parameter.outer',
                ['[C'] = '@comment.outer',
                ['[R'] = '@return.outer',
                ['[}'] = '@block.outer',
            },
        },
    },
}

return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup(opts)

            ---@diagnostic disable-next-line: inject-field
            require('nvim-treesitter.parsers').get_parser_configs().ebnf = {
                install_info = {
                    url = 'https://github.com/RubixDev/ebnf.git',
                    files = { 'src/parser.c' },
                    location = 'crates/tree-sitter-ebnf',
                    branch = 'main',
                },
            }
            vim.filetype.add({ extension = { ebnf = 'ebnf' } })
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
        },
    },

    {
        'windwp/nvim-ts-autotag',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = true,
    },
}
