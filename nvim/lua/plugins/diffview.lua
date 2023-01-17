return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewClose",
    "DiffviewFileHistory",
    "DiffviewToggleFiles",
    "DiffviewFocusFiles",
    "DiffviewLog",
  },
  init = function()
    require("which-key").register({
      g = {
        d = {
          name = "+diffview",
          d = { "<Cmd>DiffViewOpen<CR>", "diff view open" },
          q = { "<Cmd>DiffViewClose<CR>", "diff view close" },
          h = { "<Cmd>DiffViewFileHistory<CR>", "diff view file history" },
          f = { "<Cmd>DiffViewToggleFiles<CR>", "diff view toggle panel" },
          p = { "<Cmd>DiffViewFocusFiles<CR>", "diff view focus panel" },
          l = { "<Cmd>DiffViewLog<CR>", "diff view log" },
        },
      },
    }, { prefix = "<leader>", mode = "n" })
    require("which-key").register({
      r = {
        name = "+git",
        h = { "<Cmd>DiffViewFileHistory<CR>", "diff view file history" },
      },
    }, { prefix = "<leader>", mode = "v" })
  end,
}
