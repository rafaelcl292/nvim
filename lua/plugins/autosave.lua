return {
    '0x00-ketsu/autosave.nvim',
    event = { 'InsertLeave', 'TextChanged' },
    opts = {
        prompt = {
            message = '',
        },
        conditions = {
            exists = false,
            filetype_is_not = { 'harpoon', 'oil' },
        },
    },
}
