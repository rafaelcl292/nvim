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
            ['A-l'] = { 'snippet_forward' },
            ['A-h'] = { 'snippet_backward' },
            ['<C-l>'] = { 'snippet_forward' },
            ['<C-h>'] = { 'snippet_backward' },
            cmdline = {
                preset = 'none',
                ['<Tab>'] = { 'select_next' },
                ['<S-Tab>'] = { 'select_prev' },
                ['<A-p>'] = { 'select_prev' },
                ['<A-n>'] = { 'select_next' },
            },
        },

        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = 'normal',
        },

        sources = {
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        signature = { enabled = true },

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
