return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "onsails/lspkind-nvim",
    "L3MON4D3/LuaSnip",
  },
  config = function()
    vim.o.completeopt = "menuone,noselect"

    -- Setup nvim-cmp.
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noinsert",
        keyword_length = 1,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<c-u>"] = cmp.mapping.scroll_docs(-4),
        ["<c-f>"] = cmp.mapping.scroll_docs(4),
        ["<c-c>"] = cmp.mapping.complete({}),
        ["<c-e>"] = cmp.mapping.close(),
        ["<cr>"] = cmp.mapping.confirm({ select = true }),
        ["<tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<s-tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "buffer" },
        { name = "path" },
        { name = "neorg" },
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol",
          menu = {
            nvim_lua = "[Lua]",
            nvim_lsp = "[LSP]",
            path = "[Path]",
            luasnip = "[Snip]",
            buffer = "[Buffer]",
            cmp_tabnine = "[TN]",
            dap = "[Dap]",
            orgmode = "[Org]",
            tmux = "[Tmux]",
          },
        }),
      },
      experimental = {
        ghost_text = {
          hl_group = "LspCodeLens",
        },
      },
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }),
    })

    -- `/` cmdline setup.
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })
  end,
}
