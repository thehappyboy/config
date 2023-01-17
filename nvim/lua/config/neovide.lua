local M = {}

vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_remember_window_size = false
vim.g.neovide_floating_opacity = 1.0

local fontsize = 17
local font = [[VictorMono\ Nerd\ Font]]
-- local font = [[Hurmit_Nerd_Font_Mono]]
local transparency = 0.9

M.set_font_size = function(size)
  vim.cmd(string.format("set guifont=%s:h%d", font, size))
end

M.set_transparency = function(trans)
  vim.cmd(string.format("let g:neovide_transparency=%s", trans))
end

local current_fontsize = fontsize
M.change_font_size = function(amount)
  if current_fontsize + amount < 1 or current_fontsize + amount > 100 then
    return
  end
  current_fontsize = current_fontsize + amount
  M.set_font_size(current_fontsize)
end

local current_transparency = transparency
M.change_transparency = function(amount)
  if current_transparency + amount < 0.0 or current_transparency + amount > 1.0 then
    return
  end
  current_transparency = current_transparency + amount
  M.set_transparency(current_transparency)
end

M.set_font_size(fontsize)
M.set_transparency(transparency)

vim.keymap.set("n", "<C-+>", function()
  M.change_font_size(1)
end, { desc = "increase font size" })
vim.keymap.set("n", "<C-_>", function()
  M.change_font_size(-1)
end, { desc = "decrease font size" })
vim.keymap.set("n", "<C-)>", function()
  M.set_font_size(fontsize)
end, { desc = "default font size" })

vim.keymap.set("n", "<C-=>", function()
  M.change_transparency(0.1)
end, { desc = "increase transparency" })
vim.keymap.set("n", "<C-->", function()
  M.change_transparency(-0.1)
end, { desc = "decrease transparency" })
vim.keymap.set("n", "<C-0>", function()
  M.set_transparency(transparency)
end, { desc = "default transparency" })

return M
