local M = {
  "zbirenbaum/copilot.lua",
  enabled = false,
  event = "VeryLazy",
}

function M.config()
  require("copilot").setup({})
end

return M
