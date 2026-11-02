-- set inlay hint color
vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = '#6c6c6c', bg = 'NONE' })

-- show line number
vim.opt.number = true
vim.opt.cursorline = true

-- set indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- disable softwrap
vim.wo.wrap = false