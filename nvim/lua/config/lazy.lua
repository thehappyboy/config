local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = { lazy = true },
  git = {timeout=120,},
  checker = { enabled = false },
  install = {
    missing = true,
    colorscheme = { "tokyonight-moon", "gruvbox-material" },
  },
  performance = {
    cache = {
      enable = true,
      -- disable_events = {},
    },
    rtp = {
      disabled_plugins = {
        "gzip",
        "zip",
        "zipPlugin",
        "tar",
        "tarPlugin",
        "getscript",
        "getscriptPlugin",
        "matchit",
        "matchparen",
        "logiPat",
        "rrhelper",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "tohtml",
        "tutor",
        "vimball",
        "vimballPlugin",
        "2html_plugin",
      },
    },
  },
})

vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")
