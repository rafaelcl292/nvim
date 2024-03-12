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
            -- 'catppuccin/nvim',
            -- 'folke/tokyonight.nvim',
            'olimorris/onedarkpro.nvim',
            {
                'loctvl842/monokai-pro.nvim',
                requires = 'nvim-tree/nvim-web-devicons',
            },
        },
        config = function()
            require('monokai-pro').setup()
            vim.cmd('colorscheme monokai-pro-default')
            vim.cmd('hi Visual guibg=#5E4C5A')
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
                run = ':MasonUpdate',
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
            {
                'L3MON4D3/LuaSnip',
                run = 'make install_jsregexp',
                requires = 'rafamadriz/friendly-snippets',
            },
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
        config = function() require('nvim-autopairs').setup() end,
    },

    'github/copilot.vim',

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup({
                toggler = {
                    line = '<C-_>',
                    block = '<leader><C-_>',
                },
                opleader = {
                    line = '<C-_>',
                    block = '<leader><C-_>',
                },
                ignore = '^$',
            })
        end,
    },

    'lewis6991/gitsigns.nvim',

    'stevearc/oil.nvim',

    'mrjones2014/smart-splits.nvim',

    {
        'ThePrimeagen/harpoon',
        branch = 'harpoon2',
        requires = { 'nvim-lua/plenary.nvim' },
    },

    '0x00-ketsu/autosave.nvim',

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
    },

    {
        'windwp/nvim-ts-autotag',
        requires = 'nvim-treesitter/nvim-treesitter',
    },

    'echasnovski/mini.nvim',

    'romainl/vim-cool',

    {
        'Aasim-A/scrollEOF.nvim',
        config = function() require('scrollEOF').setup() end,
    },

    'RRethy/vim-illuminate',
})
