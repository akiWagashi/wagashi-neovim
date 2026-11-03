-- shared defaults for every server
vim.lsp.config('*', {
    capabilities = require('blink.cmp').get_lsp_capabilities(),
})

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

-- enable lsp
vim.lsp.enable('clangd')
vim.lsp.enable('rust-analyzer')
vim.lsp.enable('csharp-ls')
vim.lsp.enable('ty')