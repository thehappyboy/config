return {
  "nanotee/zoxide.vim",
  cmd = { "Z", "Lz" },
  dependencies = { "telescope-zoxide" },
  keys = {
    {
      "<leader>fz",
      function()
        require("telescope").extensions.zoxide.list()
      end,
      desc = "z list",
    },
  },
}
