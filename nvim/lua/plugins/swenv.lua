return {
  "AckslD/swenv.nvim",
  keys = {
    {
      "<leader>py",
      function()
        require("swenv.api").pick_venv()
      end,
      desc = "pick env",
    },
  },
  config = function()
    require("swenv").setup({
      get_venvs = function(venvs_path)
        return require("swenv.api").get_venvs(venvs_path)
      end,
      venvs_path = vim.fn.expand("~/.virtualenvs"),
    })
  end,
}
