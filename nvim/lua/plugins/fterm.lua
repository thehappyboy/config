local M = {
  "numtostr/FTerm.nvim",
  keys = {
    {
      "<c-t>",
      function()
        require("FTerm").toggle()
      end,
      mode = { "n", "t" },
    },
    {
      "<leader>gl",
      function()
        require("FTerm").lazygit.toggle()
      end,
      desc = "lazygit",
    },
  },
}

M.init = function() end

M.config = function()
  local fterm = require("FTerm")
  fterm.setup({
    dimensions = {
      height = 0.6,
      width = 0.8,
    },
  })

  -- add lazygit
  local term = require("FTerm.terminal")
  local prog = term:new():setup({
    cmd = "lazygit",
    dimensions = {
      height = 0.9,
      width = 0.8,
    },
  })

  fterm["lazygit"] = {
    toggle = function()
      prog:toggle()
    end,
  }
end

return M
