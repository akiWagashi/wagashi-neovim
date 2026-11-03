-- Enhanced LSP UI: hover, code action, rename, etc.
return
{
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({})
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },
    keys = {
        { "<leader>lj", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "Show cursor diagnostics" },
        { "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<cr>",   desc = "Show line diagnostics" },
        { "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<cr>",    desc = "Show buffer diagnostics" },
    }
}