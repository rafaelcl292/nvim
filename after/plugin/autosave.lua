require('autosave').setup {
    prompt_message = function()
        return ''
    end,
    conditions = {
        exists = false,
        filetype_is_not = { 'harpoon', 'oil' },
    }
}
