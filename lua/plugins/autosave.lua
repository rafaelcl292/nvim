return {
    '0x00-ketsu/autosave.nvim',
    event = { 'InsertLeave', 'TextChanged' },
    opts = {
        prompt_message = function() return '' end,
        conditions = {
            exists = false,
            filetype_is_not = { 'harpoon', 'oil' },
        },
    },
}
