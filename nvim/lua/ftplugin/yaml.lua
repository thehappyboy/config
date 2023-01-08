return function()
  vim.api.nvim_buf_set_option(0, "ts", 2)
  vim.api.nvim_buf_set_option(0, "sts", 2)
  vim.api.nvim_buf_set_option(0, "sw", 2)
  vim.api.nvim_buf_set_option(0, "expandtab", true)
end
