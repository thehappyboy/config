return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "popup.nvim",
    "plenary.nvim",
  },
  cmd = "Telescope",
  keys = {
    { "<c-f>", "<cmd>Telescope live_grep<cr>" },
    { "<c-p>", "<cmd>Telescope find_files<cr>" },
  },
  opts = {
    defaults = {
      -- layout_strategy = "horizontal",
      -- layout_config = {
      --   prompt_position = "bottom",
      -- },
      -- sorting_strategy = "descending",
      dynamic_preview_title = true,
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "-g",
        "!.git/**",
      },
    },
  },
}
