local function config()
    require('autosave').setup({
        prompt_message = function() return '' end,
        conditions = {
            exists = false,
            filetype_is_not = { 'harpoon', 'oil' },
        },
    })
end

return {
    '0x00-ketsu/autosave.nvim',
    config = config,
}
