local M = {
  "folke/which-key.nvim",
  event = "BufWinEnter",
}

M.config = function()
  local wk = require("which-key")
  local utils = require("utils")

  wk.setup({
    show_help = false,
    trigger = "auto",
    plugins = { spelling = true },
    key_labels = {
      ["<space>"] = "SPC",
      ["<cr>"] = "RET",
      ["<tab>"] = "TAB",
    },
  })

  wk.register({
    [","] = { "<cmd>Telescope buffers<cr>", "list buffers" },
    ["/"] = { "<cmd>Telescope live_grep<cr>", "search text" },
    ["W"] = { "<cmd>wa<cr>", "save all" },
    ["x"] = { "<cmd>q<cr>", "quit file" },
    ["X"] = { "<cmd>qa<cr>", "quit all" },
    ["Q"] = { "<cmd>wa<cr><cmd>qa<cr>", "save quit all" },
    [":"] = { "<cmd>Telescope command_history<cr>", "search command_history" },
    ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "which_key_ignore" },
    ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "which_key_ignore" },
    ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "which_key_ignore" },
    ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "which_key_ignore" },
    ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "which_key_ignore" },
    ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "which_key_ignore" },
    ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "which_key_ignore" },
    ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "which_key_ignore" },
    ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "which_key_ignore" },
    w = {
      name = "+windows",
      ["w"] = { "<C-W>p", "other-window" },
      ["d"] = { "<C-W>c", "delete-window" },
      ["-"] = { "<C-W>s", "split-window-below" },
      ["|"] = { "<C-W>v", "split-window-right" },
      ["2"] = { "<C-W>v", "layout-double-columns" },
      ["h"] = { "<C-W>h", "window-left" },
      ["j"] = { "<C-W>j", "window-below" },
      ["l"] = { "<C-W>l", "window-right" },
      ["k"] = { "<C-W>k", "window-up" },
      ["H"] = { "<C-W>5<", "expand-window-left" },
      ["J"] = { ":resize +5", "expand-window-below" },
      ["L"] = { "<C-W>5>", "expand-window-right" },
      ["K"] = { ":resize -5", "expand-window-up" },
      ["="] = { "<C-W>=", "balance-window" },
      ["s"] = { "<C-W>s", "split-window-below" },
      ["v"] = { "<C-W>v", "split-window-right" },
    },
    b = {
      name = "+buffer",
      ["["] = { "<cmd>BufferLineCyclePrev<cr>", "previous" },
      ["]"] = { "<cmd>BufferLineCycleNext<cr>", "next" },
      ["d"] = { "<cmd>bd<cr>", "del" },
      ["p"] = { "<cmd>BufferLinePick<cr>", "pick" },
      ["e"] = { "<cmd>BufferLinePickClose<cr>", "pick close" },
      ["b"] = { "<cmd>Telescope buffers<cr>", "buffers" },
    },
    d = { "<cmd>lua require'dap'.continue()<cr>", "start debug" },
    -- d = {
    --   name = "+debug",
    --   b = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "br toggle" },
    --   c = { "<cmd>lua require'dap'.continue()<cr>", "start/continue" },
    --   n = { "<cmd>lua require'dap'.step_over()<cr>", "step_over" },
    --   i = { "<cmd>lua require'dap'.step_into()<cr>", "step into" },
    --   o = { "<cmd>lua require'dap'.step_out()<cr>", "step out" },
    --   t = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "run to cursor" },
    --   w = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "info" },
    --   r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "REPL toggle" },
    --   u = { "<cmd>lua require'dapui'.toggle()<cr>", "Dap UI" },
    --   q = { "<cmd>lua require'dap'.terminate()<cr>", "terminate" },
    --   ["?"] = {
    --     '<cmd>lua local widgets=require"dap.ui.widgets";widgets.centered_float(widgets.scopes)<cr>',
    --     "scopes",
    --   },
    --   k = { '<cmd>lua require"dap".up()<cr>zz', "up callstack" },
    --   j = { '<cmd>lua require"dap".down()<cr>zz', "down callstack" },
    -- },
    g = {
      name = "+git",
      s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "stage" },
      S = { "<cmd>lua require('gitsigns').stage_buffer()<cr>", "stage buffer" },
      u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "unstage" },
      r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "reset" },
      R = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "reset buffer" },
      p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "preview" },
      b = { "<cmd>lua require('gitsigns').blame_line()<cr>", "blame" },
      t = { "<cmd>lua require('gitsigns').toggle_signs()<cr>", "toggle signs" },
    },
    f = {
      name = "+file",
      f = { "<cmd>Telescope find_files<cr>", "find file" },
      t = { "<cmd>Neotree toggle<cr>", "Neotree" },
      o = { "<cmd>Telescope oldfiles<cr>", "old files" },
    },
    s = {
      name = "+search",
      b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "buffer text" },
      l = { "<cmd>Telescope live_grep<cr>", "search text" },
      m = { "<cmd>Telescope marks", "marks" },
      h = { "<cmd>Telescope command_history<cr>", "history" },
      s = { "<cmd>Telescope colorscheme enable_preview=true<cr>", "colorscheme" },
      q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
    },
    h = {
      name = "+help",
      h = { "<cmd>Telescope help_tags<cr>", "help tags" },
      m = { "<cmd>Telescope man_pages<cr>", "man pages" },
      c = { "<cmd>Telescope commands<cr>", "commands" },
      f = { "<cmd>Telescope filetypes<cr>", "file types" },
      o = { "<cmd>Telescope vim_options<cr>", "vim options" },
      k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
    },
    t = {
      name = "+tweak",
      f = { require("plugins.lsp.formatting").toggle, "format on save" },
      s = {
        function()
          utils.toggle("spell")
        end,
        "spelling",
      },
      w = {
        function()
          utils.toggle("wrap")
        end,
        "word wrap",
      },
      n = {
        function()
          utils.toggle("relativenumber", true)
          utils.toggle("number")
        end,
        "line number",
      },
      r = { "<cmd>TSRainbowToggle<cr>", "rainbow bracket" },
    },
    z = {
      name = "+troubles",
      z = { "<cmd>TroubleToggle<cr>", "toggle" },
      w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
      b = { "<cmd>TroubleToggle document_diagnostics<cr>", "diagnostics" },
      q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
      l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
      r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
    },
  }, { prefix = "<leader>" })
end

return M
