local lsp = require('lsp-zero').preset()
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.default_capabilities()

lsp.use('lua_ls', {
    capabilities = capabilities,
    settings = {
        Lua = {
            checkThirdParty = false,
            runtime = { version = 'LuaJIT' },
            workspace = {
                -- library = {
                --     '$(3rd)/luv/library',
                --     unpack(vim.api.nvim_get_runtime_file('', true)),
                -- },
                library = { vim.env.VIMRUNTIME },
            },
            completion = {
                callSnippet = 'Replace',
            },
        },
    },
})

lsp.use('clangd', {
    capabilities = capabilities,
    cmd = {
        'clangd',
        '--offset-encoding=utf-16',
        '--fallback-style=webkit',
    },
})

lsp.on_attach(function(_, bufnr)
    local opts = { buffer = bufnr, remap = true }
    local function bind(key, cmd) vim.keymap.set({ 'n', 'v' }, key, cmd, opts) end

    bind('<leader>d', vim.diagnostic.open_float)
    bind('[d', vim.diagnostic.goto_prev)
    bind(']d', vim.diagnostic.goto_next)
    bind('<F2>', vim.lsp.buf.rename)
    bind('gd', vim.lsp.buf.definition)
    bind('gi', vim.lsp.buf.implementation)
    bind('gr', vim.lsp.buf.references)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    bind('<leader>c', vim.lsp.buf.code_action)
end)

lsp.setup()

-- set up nvim-cmp
local cmp = require('cmp')
local ls = require('luasnip')
ls.config.setup()

require('luasnip/loaders/from_vscode').lazy_load()

cmp.setup({
    snippet = {
        expand = function(args) ls.lsp_expand(args.body) end,
    },
    preselect = cmp.PreselectMode.None,
    mapping = cmp.mapping.preset.insert({
        ['<A-i>'] = cmp.mapping.confirm({ select = true }),
        ['<C-q>'] = cmp.mapping.close(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<A-p>'] = cmp.mapping.select_prev_item(),
        ['<A-n>'] = cmp.mapping.select_next_item(),
        ['<C-l>'] = cmp.mapping(function()
            if ls.expand_or_locally_jumpable() then ls.expand_or_jump() end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
            if ls.locally_jumpable(-1) then ls.jump(-1) end
        end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
        { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
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
            c = function(f) f() end,
        },
        ['<C-p>'] = {
            c = function(f) f() end,
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
