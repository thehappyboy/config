require("config.options")
require("config.lazy")
if vim.g.neovide then
  require("config.neovide")
end

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.autocmds")
    require("config.keys")
  end,
})
