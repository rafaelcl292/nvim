local function on_attach(bufnr)
    local api = require('nvim-tree.api')

    local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
    vim.keymap.set('n', 'i',     api.node.show_info_popup,              opts('Info'))
    vim.keymap.set('n', 't',     api.node.open.tab,                     opts('Open: New Tab'))
    vim.keymap.set('n', '<BS>',  api.node.navigate.parent_close,        opts('Close Directory'))
    vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))
    vim.keymap.set('n', '<Tab>', api.node.open.preview,                 opts('Open Preview'))
    vim.keymap.set('n', '>',     api.node.navigate.sibling.next,        opts('Next Sibling'))
    vim.keymap.set('n', '<',     api.node.navigate.sibling.prev,        opts('Previous Sibling'))
    vim.keymap.set('n', '0',     api.tree.change_root_to_node,          opts('CD'))
    vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', 'a',     api.fs.create,                         opts('Create'))
    vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
    vim.keymap.set('n', 'd',     api.fs.remove,                         opts('Delete'))
    vim.keymap.set('n', ']e',    api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
    vim.keymap.set('n', '[e',    api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
    vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
    vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
    vim.keymap.set('n', 'J',     api.node.navigate.sibling.last,        opts('Last Sibling'))
    vim.keymap.set('n', 'K',     api.node.navigate.sibling.first,       opts('First Sibling'))
    vim.keymap.set('n', 'o',     api.node.open.edit,                    opts('Open'))
    vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))
    vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))
    vim.keymap.set('n', 'q',     api.tree.close,                        opts('Close'))
    vim.keymap.set('n', 'r',     api.fs.rename,                         opts('Rename'))
    vim.keymap.set('n', 'R',     api.tree.reload,                       opts('Refresh'))
    vim.keymap.set('n', 'S',     api.tree.search_node,                  opts('Search'))
    vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
    vim.keymap.set('n', 'W',     api.tree.collapse_all,                 opts('Collapse'))
    vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
    vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
    vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
end

require("nvim-tree").setup({
    on_attach = on_attach,
    disable_netrw = false,
    hijack_netrw = false,
    view = {
        relativenumber = true,
        float = {
            enable = true,
            quit_on_focus_loss = true,
            open_win_config = {
                relative = "editor",
                border = "rounded",
                width = 35,
                height = 30,
                row = 0,
                col = 500,
            },
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = false,
        debounce_delay = 50,
        severity = {
            min = vim.diagnostic.severity.HINT,
            max = vim.diagnostic.severity.ERROR,
        },
    },
    git = {
        enable = false,
    },
})


vim.keymap.set('n', '<leader>e', ':NvimTreeFindFileToggle<CR>', { silent = true, noremap = true })
