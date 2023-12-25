local pckr_path = vim.fn.stdpath('data') .. '/pckr/pckr.nvim'

if not vim.loop.fs_stat(pckr_path) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/lewis6991/pckr.nvim',
        pckr_path
    })
end

vim.opt.rtp:prepend(pckr_path)

require('pckr').add {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
        }
    },

    'catppuccin/nvim',
    'folke/tokyonight.nvim',
    {
        'rebelot/kanagawa.nvim',
        config = function()
            vim.cmd('colorscheme kanagawa-dragon')
        end
    },

    {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    },

    -- LSP
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    },

    -- Autocompletion
    {
        'neovim/nvim-lspconfig',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
    },

    { 'jose-elias-alvarez/null-ls.nvim' },

    {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    },

    'github/copilot.vim',

    'ThePrimeagen/vim-be-good',

    'tpope/vim-commentary',

    'tpope/vim-unimpaired',

    'tpope/vim-surround',

    'lewis6991/gitsigns.nvim',

    'inkarkat/vim-CursorLineCurrentWindow',

    'stevearc/oil.nvim',

    'mrjones2014/smart-splits.nvim',

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } },
    },

    '0x00-ketsu/autosave.nvim',

    {
        "folke/noice.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            require("noice").setup()
        end
    },

    'bluz71/nvim-linefly',


}
