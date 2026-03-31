---@type vim.lsp.Config
return
{
    cmd = { 'csharp-ls' },
    root_dir = function(bufnr, on_dir)
        on_dir(vim.fn.getcwd())
    end,
    filetypes = { 'cs' },
    init_options = {
        AutomaticWorkspaceInit = true,
    },
    get_language_id = function(_, ft)
        if ft == 'cs' then
            return 'csharp'
        end
        return ft
    end,
}
