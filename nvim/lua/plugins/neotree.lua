return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  keys = {
    -- { "<leader>ft", "<cmd>Neotree toggle<cr>" },
    { "<F2>", "<cmd>Neotree toggle<cr>" },
  },
  config = function()
    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = { follow_current_file = true },
      window = {
        mappings = {
          ["a"] = {
            "add",
            config = {
              show_path = "relative", -- "none", "relative", "absolute"
            },
          },
        },
      },
    })
  end,
}
