-- Inline diagnostic messages at the end of lines
return
{
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy",
    priority = 1000,
    config = function()
        require("tiny-inline-diagnostic").setup()
        vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
        vim.opt.signcolumn = 'yes'
    end,
}