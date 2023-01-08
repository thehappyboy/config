local M = {
  "MunifTanjim/nui.nvim",
  "nvim-lua/plenary.nvim",
  {
    "numToStr/Comment.nvim",
    keys = { { "gc", "gb", mode = { "n", "v" } } },
    config = true,
  },
  {
    "kylechui/nvim-surround",
    keys = {
      { "ys", mode = { "n", "v" } },
      { "cs", mode = { "n", "v" } },
      { "ds", mode = { "n", "v" } },
      { "S", mode = "v" },
    },
    config = true,
  },
  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>" },
    },
    config = { use_default_keymaps = false },
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = true,
  },
  {
    "karb94/neoscroll.nvim",
    keys = { "<C-u>", "<C-d>", "<C-f>", "<C-b>" },
    config = true,
  },
  {
    "simrat39/symbols-outline.nvim",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "symbols" } },
    config = true,
  },
  {
    "folke/trouble.nvim",
    cmd = { "TroubleToggle", "Trouble" },
    config = {
      auto_open = false,
      use_diagnostic_signs = true, -- en
    },
  },
}

return M
