return {
  "neovim/nvim-lspconfig",
  -- event = "BufReadPre",
  lazy = false,
  dependencies = {
    "mason.nvim",
    "folke/neodev.nvim",
    "williamboman/mason-lspconfig.nvim",
    "null-ls.nvim",
  },
  config = function()
    require("neodev").setup({})

    require("plugins.lsp.diagnostics").setup()

    require("utils").on_attach(function(client, bufnr)
      require("plugins.lsp.keys").on_attach(client, bufnr)
      require("plugins.lsp.formatting").on_attach(client, bufnr)
    end)

    local servers = {
      pyright = {},
      yamlls = {},
      dockerls = {},
      html = {},
      cssls = {},
      jsonls = {
        settings = {
          json = {
            format = {
              enable = true,
            },
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      sumneko_lua = {
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      },
    }

    local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

    require("mason-lspconfig").setup({ ensure_installed = vim.tbl_keys(servers) })
    require("mason-lspconfig").setup_handlers({
      function(server)
        local server_opts = servers[server] or {}
        server_opts.capabilities = capabilities
        require("lspconfig")[server].setup(server_opts)
      end,
    })
  end,
}
