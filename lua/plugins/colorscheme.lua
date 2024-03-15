return {
    {
        "loctvl842/monokai-pro.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require('monokai-pro').setup()
            vim.cmd('colorscheme monokai-pro-default')
            vim.cmd('hi Visual guibg=#5E4C5A')
        end,
    },
}
