return {
  "npxbr/gruvbox.nvim",
  lazy = false,
  dependencies = { "rktjmp/lush.nvim" },
  config = function()
    require("gruvbox").load()
  end,
}
