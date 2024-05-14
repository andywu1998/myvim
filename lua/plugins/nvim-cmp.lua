return {
    {
        "hrsh7th/nvim-cmp",
        enabled = function()
        if vim.bo.filetype == "php" then
            return false
        end
    end,
    }
}
