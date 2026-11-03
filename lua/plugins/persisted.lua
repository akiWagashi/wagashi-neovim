-- Session management with auto-save and restore
return
{
  "olimorris/persisted.nvim",
  event = "BufReadPre", -- Ensure the plugin loads only when a buffer has been loaded
  opts = {
    -- Your config goes here ...
  },
}