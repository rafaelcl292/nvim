return {
    'saghen/blink.cmp',

    dependencies = {
        'rafamadriz/friendly-snippets',
    },

    version = '*',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'none',
            ['<A-i>'] = { 'accept' },
            ['<C-q>'] = { 'cancel' },
            ['<C-p>'] = { 'select_prev' },
            ['<C-n>'] = { 'select_next' },
            ['<A-p>'] = { 'select_prev' },
            ['<A-n>'] = { 'select_next' },
            ['<Down>'] = { 'select_next' },
            ['<Up>'] = { 'select_prev' },
            ['A-l'] = { 'snippet_forward' },
            ['A-h'] = { 'snippet_backward' },
            ['<C-l>'] = { 'snippet_forward' },
            ['<C-h>'] = { 'snippet_backward' },
        },

        cmdline = {
            keymap = {
                preset = 'none',
                ['<Tab>'] = { 'select_next' },
                ['<S-Tab>'] = { 'select_prev' },
                ['<A-p>'] = { 'select_prev' },
                ['<A-n>'] = { 'select_next' },
            },
            completion = {
                list = {
                    selection = {
                        preselect = false,
                    },
                },
                menu = { auto_show = true },
            },
        },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'normal',
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        signature = {
            enabled = true,
            window = { show_documentation = true },
        },

        completion = {
            documentation = { auto_show = true, auto_show_delay_ms = 500 },
            list = {
                selection = {
                    preselect = function(ctx) return ctx.mode ~= 'cmdline' end,
                },
            },
        },
    },
}
