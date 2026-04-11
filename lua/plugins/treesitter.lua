local textobjects = {
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
        branch = 'main',
        lazy = false,
        build = ':TSUpdate',
        init = function()
            vim.g.loaded_nvim_treesitter = 1
        end,
        config = function()
            vim.api.nvim_create_autocmd('FileType', {
                callback = function() pcall(vim.treesitter.start) end,
            })
        end,
    },
    {
        'lewis6991/ts-install.nvim',
        lazy = false,
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('ts-install').setup({
                auto_install = true,
                ignore_install = { 'tmux', 'make' },
            })
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        event = 'VeryLazy',
        config = function()
            require('nvim-treesitter-textobjects').setup({ textobjects = textobjects })
        end,
    },
    { 'Wansmer/treesj', config = treesj_config, event = 'VeryLazy' },
    { 'windwp/nvim-ts-autotag', config = true, event = 'InsertEnter' },
}
