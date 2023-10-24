require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = {
        "c", "lua", "rust", "ruby", "vim",
        "vimdoc", "javascript", "typescript",
        "python"
    },
    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
    },
    rainbow = {
        enable = true,
        extended_mode = false,
        max_file_lines = nil,
    },
}
