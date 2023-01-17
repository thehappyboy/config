local set_winbar = function(winbar)
  if vim.fn.has("nvim-0.8.0") ~= 1 then
    return
  end
  if vim.fn.winheight(0) <= 1 then
    return
  end
  local success, result = pcall(function()
    vim.wo.winbar = winbar
  end)
end

local active_win = function()
  if vim.bo.buftype == "nofile" then
    return
  end
  vim.wo.winhighlight = ""
  set_winbar("%#LineNrAbove#%=%m %{getcwd()}/%#LineNr#%f %#MyBufNr#(%n)")
end

local non_active_win = function()
  if vim.bo.buftype == "nofile" then
    return
  end
  vim.wo.winhighlight = "LineNr:Comment"
  set_winbar("%#LineNrAbove#%=%m %{getcwd()}/%f (%n)")
end

-- MyActiveWin = {
--   -- TODO are all these needed?
--   VimEnter = {callback = active_win},
--   BufWinEnter = {callback = active_win},
--   WinEnter = {callback = active_win},
--   WinNew = {callback = active_win},
--   WinLeave = {callback = non_active_win},
--   TabNewEntered = {callback = active_win},
-- },

vim.api.nvim_create_augroup("_activewin", { clear = true })
vim.api.nvim_create_autocmd({ "VimEnter", "BufWinEnter", "WinEnter", "WinNew", "TabNewEntered" }, {
  callback = active_win,
})
vim.api.nvim_create_autocmd({ "WinLeave" }, {
  callback = non_active_win,
})

vim.api.nvim_create_augroup("_misc", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  desc = "jump to last position when reopening a file",
  group = "_misc",
  command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]],
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight text on yank",
  group = "_misc",
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 150, on_visual = true })
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

vim.api.nvim_create_augroup("_ft", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "_ft",
  pattern = { "dap-float", "man", "help", "lsp-installer", "null-ls-info", "startuptime", "qf", "lspinfo" },
  command = [[nnoremap <buffer><silent> q :close<cr>]],
})

vim.api.nvim_create_autocmd("FileType", {
  group = "_ft",
  pattern = "*",
  callback = function()
    require("ftplugin").init()
  end,
})
