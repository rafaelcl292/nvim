return {
    'dmtrKovalenko/fff.nvim',
    build = function() require('fff.download').download_or_build_binary() end,
    lazy = false,
    opts = {
        debug = {
            enabled = true,
            show_scores = true,
        },
    },
    keys = {
        {
            '<leader>fa',
            function() require('fff').find_files() end,
            desc = 'Find files',
        },
        {
            '<leader>fg',
            function() require('fff').find_in_git_root() end,
            desc = 'Find git files',
        },
        {
            '<leader>fs',
            function() require('fff').live_grep() end,
            desc = 'Live grep',
        },
    },
}
