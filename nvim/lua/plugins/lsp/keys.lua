local M = {}

local wk = require("which-key")

M.setup = function(client, bufnr)
  local keymap = {
    buffer = bufnr,
    ["<leader>"] = {
      c = {
        name = "+code",
        -- o
        r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "rename" },
        a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "action" },
        f = { "<cmd>lua vim.lsp.buf.format({async=true})<cr>", "format" },
        d = { "<cmd>lua vim.diagnostic.open_float()<cr>", "line diagnostics" },
        l = {
          name = "+lsp",
          I = { "<cmd>LspInfo<cr>", "info" },
          s = { "<cmd>LspStart<cr>", "start" },
          a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", "add folder" },
          R = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", "remove folder" },
          l = {
            "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
            "list folders",
          },
        },
      },
      z = {
        d = { "<cmd>Telscope diagnostics<cr>", "search diagnostics" },
      },
    },
    g = {
      name = "+goto",
      d = { "<cmd>Telescope lsp_definitions<cr>", "definition" },
      r = { "<cmd>Telescope lsp_references<cr>", "reference" },
      R = { "<cmd>Trouble lsp_definitions<cr>", "trouble reference" },
      D = { "<cmd>Telescope lsp_declarations<cr>", "declaration" },
      I = { "<cmd>Telescope lsp_implementations<cr>", "implementation" },
      t = { "<cmd>Telescope lsp_type_definitions<cr>", "type definition" },
    },
    ["<c-s>"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "signature help", mode = { "n", "i" } },
    ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "hover" },
    ["[d"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "prev diagnostic" },
    ["]d"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "next diagnostic" },
    ["[e"] = { "<cmd>lua vim.diagnostic.goto_prev({serverity = vim.diagnostic.severity.ERROR})<cr>", "prev error" },
    ["]e"] = { "<cmd>lua vim.diagnostic.goto_next(serverity = vim.diagnostic.severity.ERROR)<cr>", "next error" },
    ["[w"] = { "<cmd>lua vim.diagnostic.goto_prev({serverity = vim.diagnostic.severity.WARN})<cr>", "prev warn" },
    ["]w"] = { "<cmd>lua vim.diagnostic.goto_next(serverity = vim.diagnostic.severity.WARN)<cr>", "next warn" },
  }

  wk.register(keymap)
end

return M
