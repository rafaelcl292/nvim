local function config()
    local conform = require('conform')
    conform.setup()

    conform.formatters_by_ft = {
        lua = { 'stylua' },
        go = { 'gofmt', 'goimports' },
        sh = { 'shfmt' },
        python = { 'black', 'isort' },
        ocaml = { 'ocamlformat' },
        javascript = { 'prettier' },
        xml = { 'xmlformat' },
        json = { 'fixjson' },
        yaml = { 'yamlfmt' },
    }

    conform.formatters.yamlfmt = {
        prepend_args = { '-formatter', 'retain_line_breaks_single=true' },
    }

    conform.formatters.stylua = {
        prepend_args = {
            '--indent-type',
            'Spaces',
            '--quote-style',
            'AutoPreferSingle',
            '--column-width',
            '79',
            '--collapse-simple-statement',
            'Always',
        },
    }

    conform.formatters.shfmt = {
        prepend_args = { '-i', '4', '-ci' },
    }

    conform.formatters.black = {
        prepend_args = { '--line-length', '79' },
    }

    local function conform_format()
        conform.format({
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        })
    end
    vim.keymap.set({ 'v', 'n' }, '<leader>s', conform_format)
end

return {
    'stevearc/conform.nvim',
    config = config,
}
