return 
{
    {
        'sontungexpt/better-diagnostic-virtual-text',
        event = 'VeryLazy',  -- LSP 附加时加载
        enabled = true,
        config = function()
            vim.opt.signcolumn = 'yes'

            -- 关闭原生 virtual_text
            vim.diagnostic.config({
                virtual_text = false,  -- 必须关闭
                signs = true,
                underline = true,
                update_in_insert = true,
            })

            require('better-diagnostic-virtual-text').setup({
                inline = true,  -- 只显示当前行的诊断
                priority = 2003,
                ui = {
                    above = false,  -- 显示在下方
                    arrow = "  ",
                    up_arrow = "  ",
                    down_arrow = "  ",
                    left_kept_space = 3,
                    right_kept_space = 3,
                    wrap_line_after = false,
                },
            })
        end,
    },
    {
        'sontungexpt/better-diagnostic-virtual-text',
        keys = {
            {
                '<leader>td',
                function()
                    local enabled = vim.diagnostic.is_enabled({ bufnr = 0 })
                    vim.diagnostic.enable(not enabled, { bufnr = 0 })
                    vim.notify("Diagnostics: " .. (not enabled and "enabled" or "disabled"))
                end,
                desc = "Toggle diagnostics virtual text",
            },
        },
    },
}