-- Session management with auto-save and restore
return
{
  "olimorris/persisted.nvim",
  event = "BufReadPre", -- Ensure the plugin loads only when a buffer has been loaded
  opts = {
    -- Your config goes here ...
    autostart      = false,
    autoload       = false,
    follow_cwd     = false,
    use_git_branch = true,

    -- Skip saving when nothing worth restoring is open (e.g. only the dashboard)
    should_save    = function()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        local is_real_file = vim.bo[buf].buftype == "" and vim.api.nvim_buf_get_name(buf) ~= ""
        if is_real_file and vim.api.nvim_buf_is_loaded(buf) then
          return true
        end
      end
      return false
    end,

    -- Terminal buffers break :mksession, drop them before writing
    before_save    = function()
      if not opts.auto then
        return -- manual :Persisted save should keep terminals alive
      end
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].buftype == "terminal" then
          vim.api.nvim_buf_delete(buf, { force = true })
        end
      end
    end,
  },

  -- What :mksession writes into the session file
  init = function()
    vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"
  end,

  keys = {
    { "<leader>qs", "<cmd>Persisted select<cr>",    desc = "Select Session" },
    { "<leader>ql", "<cmd>Persisted load<cr>",      desc = "Load Session" },
    { "<leader>qL", "<cmd>Persisted load_last<cr>", desc = "Load Last Session" },
    { "<leader>qS", "<cmd>Persisted save<cr>",      desc = "Save Session" },
    { "<leader>qd", "<cmd>Persisted delete<cr>",    desc = "Delete Session" },
  },
}
