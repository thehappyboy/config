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
  local bufnr = vim.api.nvim_get_current_buf()
  local ft = vim.bo[bufnr].filetype
  local has_nls = #require("null-ls.sources").get_available(ft, "NULL_LS_FORMATTING") > 0

  vim.lsp.buf.format(vim.tbl_deep_extend("force",{
    bufnr = bufnr,
    filter = function(client)
      if has_nls then
        return client.name == "null-ls"
      end
      return client.name ~= "null-ls"
    end,
  }, utils.opts("nvim-lspconfig").format or {}))
end

function M.on_attach(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormat." .. bufnr, {}),
      buffer = buf,
      callback = function()
        if M.autoformat then
          M.format()
        end
      end,
    })
  end
end



return M
