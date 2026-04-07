require("config.lazy")

-- set lsp config
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local bufnr = ev.buf

        -- enable inlay_hint
        vim.defer_fn(function()
                    vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end, 300)
    end,
})

-- set inlay hint color
vim.api.nvim_set_hl(0, 'LspInlayHint', { fg = '#6c6c6c', bg = 'NONE' })

-- show line number
vim.opt.number = true
vim.opt.cursorline = true

-- enable lsp
vim.lsp.enable('clangd')
vim.lsp.enable('rust-analyzer')
vim.lsp.enable('csharp-ls')
vim.lsp.enable('ty')
