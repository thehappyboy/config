local utils = require("utils")
local M = {}

M.autoformat = true

function M.toggle()
  M.autoformat = not M.autoformat
  if M.autoformat then
    utils.info("enable format on save", "Formatting")
  else
    utils.warn("disable format on save", "Formatting")
  end
end

function M.format()
  if M.autoformat then
    vim.lsp.buf.format()
  end
end

function M.setup(client, buf)
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")

  local sources = require("null-ls.sources")
  local available = sources.get_available(ft, "NULL_LS_FORMATTING")

  if available then
    client.server_capabilities.documentFormattingProvider = true
    vim.cmd([[
      augroup LspFormat
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua require("plugins.lsp.formatting").format()
      augroup END
    ]])
  end
end

return M
