return {
  "rcarriga/nvim-dap-ui",
  init = function()
    vim.keymap.set("n", "<localleader>u", "<cmd>lua require'dapui'.toggle()<cr>", { desc = "ui_toggle" })
    vim.keymap.set({ "n", "v" }, "<localleader>e", "<cmd>lua require'dapui'.eval()<cr>", { desc = "eval" })
  end,
  config = true,
}
