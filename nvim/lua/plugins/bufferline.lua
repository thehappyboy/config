local M = {
  "akinsho/nvim-bufferline.lua",
  lazy = false,
  -- event = "BufAdd",
}

M.config = function()
  require("bufferline").setup({
    options = {
      show_close_icon = true,
      show_tab_indicators = true,
      diagnositcs = "nvim_lsp",
      always_show_bufferline = true,
      separator_style = "thick",
      offsets = {
        {
          filetype = "undotree",
          text = "Undotree",
          highlight = "PanelHeading",
          padding = 1,
        },
        {
          filetype = "neo-tree",
          text = "FileTree",
          highlight = "Directory",
          text_align = "left",
        },
        {
          filetype = "Outline",
          text = "Symbols",
          text_align = "left",
        },
      },
    },
  })
end

return M
