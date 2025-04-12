local function config()
    local conform = require('conform')
    conform.setup()

    conform.formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofmt', 'goimports' },
        sh = { 'shfmt' },
        python = { 'ruff_format', 'ruff_fix', 'ruff_organize_imports' },
        ocaml = { 'ocamlformat' },
        xml = { 'xmlformat' },
        json = { 'fixjson' },
        yaml = { 'yamlfmt' },
        javascript = { 'biome' },
        typescript = { 'biome' },
        javascriptreact = { 'biome' },
        typescriptreact = { 'biome' },
    }

    conform.formatters.yamlfmt = {
        prepend_args = { '-formatter', 'retain_line_breaks_single=true' },
    }

    conform.formatters.biome = {
        prepend_args = {
            'format',
            '--indent-width=2',
            '--indent-style=space',
        },
    }

    conform.formatters.stylua = {
        prepend_args = {
            '--indent-type',
            'Spaces',
            '--quote-style',
            'AutoPreferSingle',
            '--column-width',
            '88',
            '--collapse-simple-statement',
            'Always',
        },
    }

    conform.formatters.shfmt = {
        prepend_args = { '-i', '4', '-ci' },
    }

    local function conform_format()
        conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 600,
        })
    end
    vim.keymap.set({ 'v', 'n' }, '<leader>s', conform_format)
end

return {
    'stevearc/conform.nvim',
    config = config,
    event = 'VeryLazy',
}
