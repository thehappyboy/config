local M = {
  "lewis6991/gitsigns.nvim",
  -- event = "BufReadPre",
  event = "VeryLazy",
}

M.config = function()
  require("gitsigns").setup({
    signs = {
      add = { hl = "GitSignsAdd", text = "▍", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = "▍", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = "▸", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitSignsDelete", text = "▾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "GitSignsChange", text = "▍", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
  })

  vim.keymap.set("n", "]h", function()
    if vim.wo.diff then
      return "]h"
    end
    vim.schedule(function()
      require("gitsigns").next_hunk()
    end)
    return "<Ignore>"
  end, { expr = true, desc = "Next Hunk" })

  vim.keymap.set("n", "[h", function()
    if vim.wo.diff then
      return "[h"
    end
    vim.schedule(function()
      require("gitsigns").prev_hunk()
    end)
    return "<Ignore>"
  end, { expr = true, desc = "Prev Hunk" })
end

return M
