return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  init = function()
    -- Disable entire built-in ftplugin mappings to avoid conflicts.
    -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
    vim.g.no_plugin_maps = true

    -- Or, disable per filetype (add as you like)
    -- vim.g.no_python_maps = true
    -- vim.g.no_ruby_maps = true
    -- vim.g.no_rust_maps = true
    -- vim.g.no_go_maps = true
  end,
  config = function()
    local ts_textobjects = require("nvim-treesitter-textobjects")

    ts_textobjects.setup({
      select = {
        lookahead = true,
        selection_modes = {
          ["@parameter.outer"] = "v",
          ["@function.outer"] = "V",
        },
        include_surrounding_whitespace = false,
      },

      move = {
        set_jumps = true,
      },
    })

    -- select
    vim.keymap.set({ "x", "o" }, "af", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
    end, { desc = "Select around function" })

    vim.keymap.set({ "x", "o" }, "if", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
    end, { desc = "Select inner function" })

    vim.keymap.set({ "x", "o" }, "ac", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
    end, { desc = "Select around class" })

    vim.keymap.set({ "x", "o" }, "ic", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
    end, { desc = "Select inner class" })

    vim.keymap.set({ "x", "o" }, "aa", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
    end, { desc = "Select around parameter" })

    vim.keymap.set({ "x", "o" }, "ia", function()
      require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
    end, { desc = "Select inner parameter" })

    -- move
    vim.keymap.set({ "n", "x", "o" }, "]f", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
    end, { desc = "Next function start" })

    vim.keymap.set({ "n", "x", "o" }, "[f", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
    end, { desc = "Previous function start" })

    vim.keymap.set({ "n", "x", "o" }, "]c", function()
      require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
    end, { desc = "Next class start" })

    vim.keymap.set({ "n", "x", "o" }, "[c", function()
      require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
    end, { desc = "Previous class start" })

    -- swap
    vim.keymap.set("n", "<leader>a", function()
      require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
    end, { desc = "Swap with next parameter" })

    vim.keymap.set("n", "<leader>A", function()
      require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.outer")
    end, { desc = "Swap with previous parameter" })

    -- repeatable move
    local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

    vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next, {
      desc = "Repeat last move forward",
    })

    vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous, {
      desc = "Repeat last move backward",
    })
  end,
}