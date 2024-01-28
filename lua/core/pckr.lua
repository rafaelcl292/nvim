local pckr_path = vim.fn.stdpath('data') .. '/pckr/pckr.nvim'

if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/lewis6991/pckr.nvim',
        pckr_path,
    })
end

vim.opt.rtp:prepend(pckr_path)

require('pckr').add({
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        requires = {
            'nvim-lua/plenary.nvim',
            { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
            'nvim-tree/nvim-web-devicons',
        },
    },

    {
        'rebelot/kanagawa.nvim',
        requires = {
            'catppuccin/nvim',
            'folke/tokyonight.nvim',
            'olimorris/onedarkpro.nvim',
            'loctvl842/monokai-pro.nvim',
        },
        config = function()
            vim.cmd('colorscheme monokai-pro-default')
            vim.cmd('hi Visual gui=reverse')
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            {
                'williamboman/mason.nvim',
                run = function() pcall(vim.cmd, 'MasonUpdate') end,
            },
            {
                'williamboman/mason-lspconfig.nvim',
                requires = 'williamboman/mason.nvim',
            },
            {
                'WhoIsSethDaniel/mason-tool-installer.nvim',
                requires = 'williamboman/mason.nvim',
            },

            -- Autocompletion
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'saadparwaiz1/cmp_luasnip',

            -- Formatting
            {
                'stevearc/conform.nvim',
                requires = 'williamboman/mason.nvim',
            },
        },
    },

    {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup({}) end,
    },

    'github/copilot.vim',

    'tpope/vim-commentary',

    'tpope/vim-unimpaired',

    'tpope/vim-surround',

    'lewis6991/gitsigns.nvim',

    'inkarkat/vim-CursorLineCurrentWindow',

    'stevearc/oil.nvim',

    'mrjones2014/smart-splits.nvim',

    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { { 'nvim-lua/plenary.nvim' } },
    },

    '0x00-ketsu/autosave.nvim',

    {
        'folke/noice.nvim',
        requires = {
            'MunifTanjim/nui.nvim',
        },
    },

    'bluz71/nvim-linefly',

    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
        requires = 'nvim-treesitter/nvim-treesitter',
    },

    {
        'kdheepak/lazygit.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
        config = function()
            vim.keymap.set(
                { 'n', 'v' },
                '<leader>g',
                ':LazyGit<CR>',
                { silent = true }
            )
            vim.g.lazygit_floating_window_scaling_factor = 1
        end,
    },

    {
        'windwp/nvim-ts-autotag',
        requires = 'nvim-treesitter/nvim-treesitter',
    },

    'nathanaelkane/vim-indent-guides',

    'echasnovski/mini.nvim',
})
