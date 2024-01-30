local lsp = require('lsp-zero').preset({})

lsp.setup()

lsp.use('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' },
            },
        },
    },
})

-- Global mappings.
vim.keymap.set({ 'n', 'v' }, '<leader>d', vim.diagnostic.open_float)
vim.keymap.set({ 'n', 'v' }, '[d', vim.diagnostic.goto_prev)
vim.keymap.set({ 'n', 'v' }, ']d', vim.diagnostic.goto_next)
vim.keymap.set({ 'n', 'v' }, '<F2>', vim.lsp.buf.rename)
vim.keymap.set({ 'n', 'v' }, 'gd', vim.lsp.buf.definition)
vim.keymap.set({ 'n', 'v' }, 'gD', vim.lsp.buf.declaration)
vim.keymap.set({ 'n', 'v' }, '<Tab>', vim.lsp.buf.hover)
vim.keymap.set({ 'n', 'v' }, '<leader>c', vim.lsp.buf.code_action)

-- set up nvim-cmp
local cmp = require('cmp')
local ls = require('luasnip')
require('luasnip/loaders/from_vscode').lazy_load()

vim.keymap.set(
    { 'i', 's' },
    '<C-n>',
    function() ls.jump(1) end,
    { silent = true }
)
vim.keymap.set(
    { 'i', 's' },
    '<C-p>',
    function() ls.jump(-1) end,
    { silent = true }
)

cmp.setup({
    snippet = {
        expand = function(args) ls.lsp_expand(args.body) end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<A-i>'] = cmp.mapping.confirm({ select = true }),
        ['<C-q>'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<A-p>'] = cmp.mapping.select_prev_item(),
        ['<A-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = function() end,
        ['<C-n>'] = function() end,
    }),
    sources = cmp.config.sources({
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'nvim_lsp' },
        { name = 'path' },
    }, {
        { name = 'buffer' },
    }),
})

cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
    }, {
        { name = 'buffer' },
    }),
})

cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
    },
})

cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline({
        ['<C-n>'] = {
            c = function(fallback) fallback() end,
        },
        ['<C-p>'] = {
            c = function(fallback) fallback() end,
        },
        ['<C-h>'] = {
            c = function() end,
        },
        ['<C-j>'] = {
            c = function() end,
        },
    }),
    sources = cmp.config.sources({
        { name = 'path' },
    }, {
        { name = 'cmdline' },
    }),
})
