---@type vim.lsp.Config
return
{
    cmd = { 'csharp-ls' },
    root_dir = function(bufnr, on_dir)
        local root = vim.fs.root(bufnr, function(name)
            return name:match('%.sln$') or name:match('%.csproj$') or name == '.git'
        end)
        on_dir(root)
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
