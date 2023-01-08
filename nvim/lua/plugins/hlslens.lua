local M = {
  "kevinhwang91/nvim-hlslens",
  keys = "/",
  init = function()
    vim.keymap.set(
      "n",
      "n",
      '<cmd>execute("normal! " . v:count1 . "n")<cr><cmd>lua require("hlslens").start()<cr>zzzv',
      { silent = true }
    )
    vim.keymap.set(
      "n",
      "N",
      '<cmd>execute("normal! " . v:count1 . "N")<cr><cmd>lua require("hlslens").start()<cr>zzzv',
      { silent = true }
    )
    vim.keymap.set("n", "*", "*<cmd>lua require('hlslens').start()<cr>", {})
    vim.keymap.set("n", "#", "#<cmd>lua require('hlslens').start()<cr>", {})
    vim.keymap.set("n", "g*", "g*<cmd>lua require('hlslens').start()<cr>", {})
    vim.keymap.set("n", "g#", "g#<cmd>lua require('hlslens').start()<cr>", {})
  end,
}

return M
