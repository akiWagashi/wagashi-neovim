local keymap = vim.keymap.set

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- Split / close window
keymap("n", "<leader>wv", "<C-w>v", { desc = "Vertical split" })
keymap("n", "<leader>ws", "<C-w>s", { desc = "Horizontal split" })
keymap("n", "<leader>wc", "<C-w>c", { desc = "Close current window" })