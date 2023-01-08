local M = {
  "b0o/SchemaStore.nvim",
  {
    "SmiteshP/nvim-navic",
    dependencies = "neovim/nvim-lspconfig",
  },
  {
    "j-hui/fidget.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "m-demare/hlargs.nvim",
    event = "VeryLazy",
    config = true,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      local tools = {
        "prettierd",
        "stylua",
        "black",
        "flake8",
        "debugpy",
      }
      require("mason").setup()

      -- atuo install the tools
      local mr = require("mason-registry")
      for _, tool in ipairs(tools) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = { automatic_installation = true },
  },
  "ray-x/lsp_signature.nvim",
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    ft = { "lua", "python", "html", "css", "json" },
    -- event = "VeryLazy",
    dependencies = {
      "folke/neodev.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("plugins.lsp.diagnostics").setup()
      require("neodev").setup({})

      local function on_attach(client, bufnr)
        require("nvim-navic").attach(client, bufnr)
        require("plugins.lsp.keys").setup(client, bufnr)
      end

      local servers = {
        bashls = {},
        clangd = {},
        cssls = {},
        dockerls = {},
        html = {},
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
        pyright = {},
        yamlls = {},
        sumneko_lua = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      }

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      local border = "rounded"
      local handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
      }

      local options = {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        flags = {
          debounce_text_changes = 150,
        },
      }

      for server, opts in pairs(servers) do
        opts = vim.tbl_deep_extend("force", {}, options, opts or {})
        require("lspconfig")[server].setup(opts)
      end

      require("lsp_signature").setup({
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        floating_window = false, -- show hint in a floating window, set to false for virtual text only mode
        hint_enable = true, -- virtual hint enable
        hint_prefix = " ",
        handler_opts = {
          border = "rounded",
        },
      })
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    config = function()
      local nls = require("null-ls")

      nls.setup({
        debounce = 150,
        save_after_format = false,
        sources = {
          nls.builtins.formatting.stylua.with({
            extra_args = { "--config-path", vim.fn.expand("~/.config/nvim/.stylua.toml") },
          }),
          nls.builtins.formatting.prettierd,
          nls.builtins.formatting.black,
          nls.builtins.formatting.reorder_python_imports.with({
            command = vim.fn.expand("~/.virtualenvs/neovim/bin/reorder-python-imports"),
          }),
        },
        on_attach = function(client, bufnr)
          require("plugins.lsp.formatting").setup(client, bufnr)
          require("plugins.lsp.keys").setup(client, bufnr)
        end,
      })
    end,
  },
}

return M
