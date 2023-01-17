return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  dependencies = {
    "nvim-treesitter-context",
    "nvim-ts-rainbow",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua",
        "python",
        "vim",
        "bash",
        "json",
        "toml",
        "yaml",
        "html",
        "css",
        "javascript",
        "norg",
        "regex",
        "markdown",
        "markdown_inline",
      },
      sync_install = false,
      auto_install = true,
      highlight = { enable = true },
      fold = { enable = true },
      indent = {
        enable = true,
        disable = { "python" },
      },
    })
  end,
}
