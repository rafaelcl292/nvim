require 'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "c",
        "cpp",
        "css",
        "dockerfile",
        "go",
        "gomod",
        "html",
        "java",
        "javascript",
        "json",
        "jsonc",
        "lua",
        "python",
        "regex",
        "rust",
        "toml",
        "typescript",
        "yaml",
    },
    -- -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        disable = function(lang, _)
            if lang == "bash" then
                return true
            end
        end,
    },
    -- rainbow = {
    --     enable = true,
    --     extended_mode = false,
    --     max_file_lines = nil,
    -- },
}
