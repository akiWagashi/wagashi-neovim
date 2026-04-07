return
{
    "kurama622/clean-diagnostic",
    event = "LspAttach",
    config = function ()
        vim.opt.signcolumn = 'yes'
    end,
    opts = {
        sign_text = { "", "", "", "" },
        border = "rounded",
        min_severity = 4,
        max_width = 78,
    },
    keys = {
        {
            "<leader>sd",
            "<cmd>lua require('clean-diagnostic').show()<cr>",
            desc = "show the diagnostic of the current line",
        },
    },
}
