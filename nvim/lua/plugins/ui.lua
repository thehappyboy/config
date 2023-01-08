local M = {
  {
    "nvim-tree/nvim-web-devicons",
    config = { default = true },
  },
  {
    "ellisonleao/gruvbox.nvim",
    enable = false,
    config = function()
      vim.cmd([[colorscheme gruvbox]])
    end,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_better_performance = 1

      vim.cmd([[colorscheme gruvbox-material]])
    end,
  },
  { "olimorris/onedarkpro.nvim" },
  {
    "folke/tokyonight.nvim",
    -- lazy = false,
    config = function()
      vim.cmd([[colorscheme tokyonight-moon]])
    end,
  },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  -- {
  --   "windwp/windline.nvim",
  --   event = "VeryLazy",
  --   config = function()
  --     require("wlsample.evil_line")
  --   end,
  -- },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    config = true,
  },
}

return M
