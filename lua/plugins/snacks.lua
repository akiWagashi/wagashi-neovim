-- collection of small QoL plugins
return
{
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        picker = { enabled = true },
        notifier = { enabled = true },
        scope = { enabled = true },
        words = { enabled = true },
        terminal = {
            enabled = true,
            shell = "pwsh --NoLogo",
			win = {
				style = "terminal",
				wo = {
					winhighlight = "Normal:Normal,NormalNC:NormalNC",
				}
			}
        },
        dashboard =
        {
            enabled = true,
            preset = {
                header = "akiWagashi"
            }
        },
    },
    keys = {
        { "<leader>n",   function() Snacks.picker.notifications() end,                           desc = "Notification History" },
        { "<leader>wt",  function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },

        -- find
        { "<leader>fb",  function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
        { "<leader>ff",  function() Snacks.picker.files() end,                                   desc = "Find Files" },
        { "<leader>fc",  function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>fg",  function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
        { "<leader>fp",  function() Snacks.picker.projects() end,                                desc = "Projects" },
        { "<leader>fr",  function() Snacks.picker.recent() end,                                  desc = "Recent" },
        -- git
        { "<leader>gb",  function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
        { "<leader>gl",  function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
        { "<leader>gL",  function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
        { "<leader>gs",  function() Snacks.picker.git_status() end,                              desc = "Git Status" },
        { "<leader>gS",  function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
        { "<leader>gd",  function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
        { "<leader>gf",  function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
        -- LSP
        { "<leader>ld",  function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
        { "<leader>lD",  function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
        { "<leader>lr",  function() Snacks.picker.lsp_references() end,                          desc = "References" },
        { "<leader>li",  function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementations" },
        { "<leader>lt",  function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
        { "<leader>ls",  function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
        { "<leader>lS",  function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
        { "<leader>lci", function() Snacks.picker.lsp_incoming_calls() end,                      desc = "Incoming Calls" },
        { "<leader>lco", function() Snacks.picker.lsp_outgoing_calls() end,                      desc = "Outgoing Calls" },
        -- Grep
        { "<leader>sb",  function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
        { "<leader>sB",  function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
        { "<leader>sg",  function() Snacks.picker.grep() end,                                    desc = "Grep" },
        { "<leader>sw",  function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    }
}
