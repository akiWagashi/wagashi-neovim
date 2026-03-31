return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000,
  config = function()
    require("everforest").setup({
        --- 选择背景强度: 'hard', 'medium', 'soft'
        background = "medium",
        --- 允许斜体
        italic = true,
        transparent_background_level = 2, -- 0 为不透明，1 为浅色背景，2 为全透明
        on_highlights = function(hl, palette)
            hl.CursorLine = { bg = palette.none }
            hl.CursorLineNr = { fg = "#87CEFA", bold = true }
        end,
    })

    vim.cmd([[colorscheme everforest]])
  end,
}