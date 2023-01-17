return {
  "folke/todo-comments.nvim",
  event = "VeryLazy",
  opts = {
    highlight = {
      pattern = [[.*<(KEYWORDS)\s*]],
    },
    search = {
      pattern = [[\b(KEYWORDS)\b]],
    },
  },
}

