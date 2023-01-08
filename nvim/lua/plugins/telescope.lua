local M = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
}

M.config = function()
  local telescope = require("telescope")

  vim.keymap.set("n", "<c-f>", "<cmd>Telescope live_grep<cr>")
  vim.keymap.set("n", "<c-p>", "<cmd>Telescope find_files<cr>")

  telescope.setup({
    defaults = {
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",
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
        -- "-g",
        -- "'!.git/*'",
      },
    },
  })

  telescope.load_extension("fzf")
end

return M
