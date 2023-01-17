return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = {
    "nvim-lspconfig",
  },
  config = function()
    local nls = require("null-ls")

    nls.setup({
      debounce = 150,
      save_after_format = false,
      sources = {
        nls.builtins.formatting.stylua.with({
          extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/.stylua.toml") },
        }),
        nls.builtins.formatting.prettierd,
        nls.builtins.formatting.black,
        nls.builtins.formatting.reorder_python_imports.with({
          command = vim.fn.expand("~/.virtualenvs/neovim/bin/reorder-python-imports"),
        }),
      },
    })
  end,
}
