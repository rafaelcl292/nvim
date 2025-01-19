local opts = {
    ignore_install = { 'tmux', 'make' },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
}

opts.ensure_installed = {
    'bash',
    'markdown',
    'markdown_inline',
    'c',
    'cpp',
    'css',
    'go',
    'gomod',
    'html',
    'javascript',
    'jsdoc',
    'json',
    'jsonc',
    'lua',
    'python',
    'regex',
    'rust',
    'toml',
    'typescript',
    'yaml',
    'diff',
}

opts.textobjects = {
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
    swap = {
        enable = true,
        swap_next = { ['<leader>>'] = '@parameter.inner' },
        swap_previous = { ['<leader><'] = '@parameter.inner' },
    },
}

local function treesj_config()
    local tsj = require('treesj')
    tsj.setup({
        use_default_keymaps = false,
        notify = false,
    })
    vim.keymap.set('n', '<leader>x', tsj.toggle)
end

return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function() require('nvim-treesitter.configs').setup(opts) end,
        event = 'VeryLazy',
    },
    { 'nvim-treesitter/nvim-treesitter-textobjects', event = 'VeryLazy' },
    { 'Wansmer/treesj', config = treesj_config, event = 'VeryLazy' },
    { 'windwp/nvim-ts-autotag', config = true, event = 'InsertEnter' },
}
