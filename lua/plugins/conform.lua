local function conform_config()
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
        yaml = { 'yq' },
    }

    conform.formatters.yq = {
        prepend_args = { '--indent', '4' },
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

    vim.keymap.set(
        { 'v', 'n' },
        '<leader>s',
        function()
            require('conform').format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            })
        end
    )
end

return {
    'stevearc/conform.nvim',
    config = conform_config,
}
