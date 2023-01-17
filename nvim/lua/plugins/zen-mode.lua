return {
  "folke/zen-mode.nvim",
  dependencies = { "twilight.nvim" },
  cmd = "ZenMode",
  wkeys = { {
    F = { "<Cmd>ZenMode<CR>", "focus" },
  }, { prefix = "<leader>" } },
  opts = {
    window = {
      options = {
        signcolumn = "no", -- disable signcolumn
        number = false, -- disable number column
        relativenumber = false, -- disable relative numbers
        foldcolumn = "0", -- disable fold column
      },
    },
    plugins = {
      gitsigns = { enabled = true }, -- disables git signs
      -- this will change the font size on kitty when in zen mode
      -- to make this work, you need to set the following kitty options:
      -- - allow_remote_control socket-only
      -- - listen_on unix:/tmp/kitty
      kitty = {
        enabled = false,
        font = "+4", -- font size increment
      },
    },
    -- callback where you can add custom code when the Zen window opens
    -- on_open = function(win)
    --     vim.cmd('Limelight')
    -- end,
    -- callback where you can add custom code when the Zen window closes
    -- on_close = function()
    --     vim.cmd('Limelight!')
    -- end,
  },
}

