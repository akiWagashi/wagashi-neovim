return 
{
    "startup-nvim/startup.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim"
    },
    config = function()
        local theme = require("startup.themes.dashboard")

        local has_yazi = pcall(require, "yazi")
        local file_mgr_name = has_yazi and "󰇥 Yazi Manager" or " File Browser"
        local file_mgr_cmd = has_yazi and "Yazi" or "Telescope file_browser"

        theme.body.content = {{" Find File", "Telescope find_files", "<leader>sf"},
                              {"󰍉 Find Word", "Telescope live_grep", "<leader>sg"},
                              {" Recent Files", "Telescope oldfiles", "<leader>so"},
                              {file_mgr_name, file_mgr_cmd, "<leader>se"},
                              {" Colorschemes", "Telescope colorscheme", "<leader>sc"},
                              {" New File", "lua require'startup'.new_file()", "<leader>sn"}}

        theme.options.after = function()
            local map = vim.keymap.set
            local opts = {
                noremap = true,
                silent = true
            }
            vim.g.mapleader = " "

            map("n", "<leader>sf", "<cmd>Telescope find_files<cr>", opts)
            map("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", opts)
            map("n", "<leader>so", "<cmd>Telescope oldfiles<cr>", opts)
            map("n", "<leader>se", "<cmd>" .. file_mgr_cmd .. "<cr>", opts)
            map("n", "<leader>sc", "<cmd>Telescope colorscheme<cr>", opts)
        end

        theme.footer.content = {"akiWagashi"}

        theme.options.paddings = {10, 3, 2}

        theme.parts = {"header", "body", "footer"}

        require("startup").setup(theme)
    end
}
