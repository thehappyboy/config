local M = {}

M.init = function()
  local filetype = vim.bo.filetype
  if string.len(filetype) == 0 then
    return
  end
  filetype = vim.fn.substitute(filetype, "-term$", "", "") -- use same for terminal of filetype
  local ok, init = pcall(require, "ftplugin." .. filetype)
  if ok then
    init()
  end
end

return M
