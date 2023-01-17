local M = {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>si",
      function()
        require("telescope").extensions.notify.notify()
      end,
      desc = "notifications",
    },
  },
  config = function()
    require("notify").setup({
      background_colour = "#000000",
      timeout = 3000,
    })
    vim.notify = require("notify")
  end,
}

return M
