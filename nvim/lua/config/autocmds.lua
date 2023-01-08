vim.api.nvim_create_augroup("_misc", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "jump to last position when reopening a file",
  group = "_misc",
  pattern = "*",
  callback = function()
    local last_pos = vim.fn.line("'\"")
    if last_pos > 0 and last_pos <= vim.fn.line("$") then
      vim.api.nvim_win_set_cursor(0, { last_pos, 0 })
    end
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight text on yank",
  group = "_misc",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "remove whitespaces on save",
  group = "_misc",
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "don't auto comment new line",
  group = "_misc",
  pattern = "*",
  command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

local init_color_fg = vim.api.nvim_get_hl_by_name("CursorLineNr", true).foreground
local init_color_bg = vim.api.nvim_get_hl_by_name("CursorLineNr", true).background

vim.api.nvim_create_autocmd({ "ModeChanged", "InsertLeave" }, {
  desc = "change cursor color on mode change",
  group = "_misc",
  callback = function()
    local mode = vim.api.nvim_get_mode().mode
    if mode == "i" then
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#000000", bg = "#ac3131", bold = true })
    elseif mode == "v" or mode == "V" or mode == "" then
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#000000", bg = "#d1d1d1", bold = true })
    else
      vim.api.nvim_set_hl(0, "CursorLineNr", { fg = init_color_fg, bg = init_color_bg, bold = true })
    end
  end,
})

vim.api.nvim_create_augroup("_ft", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "_ft",
  pattern = { "man", "help", "lsp-installer", "null-ls-info", "startuptime", "qf", "lspinfo" },
  command = [[nnoremap <buffer><silent> q :close<cr>]],
})

vim.api.nvim_create_autocmd("FileType", {
  group = "_ft",
  pattern = "*",
  callback = function()
    require("ftplugin").init()
  end,
})
