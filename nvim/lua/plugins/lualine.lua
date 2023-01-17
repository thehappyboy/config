return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-web-devicons",
    "swenv.nvim",
  },
  event = "VeryLazy",
  config = function()
    local gruvbox = require("lualine.themes.gruvbox")

    for _, mode in ipairs({
      "normal",
      "insert",
      "visual",
      "replace",
      "command",
      "inactive",
    }) do
      gruvbox[mode].c.fg = "#a89984"
      gruvbox[mode].c.bg = "none"
    end

    vim.opt.showmode = false

    local function get_env()
      local format = "(%s)"
      local bufnr = vim.api.nvim_get_current_buf()
      local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
      if filetype == "python" then
        local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV")
        if venv then
          return string.format(format, vim.fn.fnamemodify(venv, ":t"))
        end
      end
      return ""
    end

    require("lualine").setup({
      options = {
        icons_enable = true,
        theme = "auto",
        section_separators = "",
        component_separators = "",
        disabled_filetypes = { "lazy" },
        globalstatus = true,
      },
      sections = {
        lualine_a = {"mode"},
        lualine_b = {
          { "b:gitsigns_head", icon = { "", color = { fg = "#f2891c" } } },
          { get_env },
          { "filename", path = 1, symbols = { modified = "[]", readonly = " " } },
          {
            "diagnostics",
            sources = { "nvim_diagnostic" },
            symbols = {
              error = " ",
              warn = " ",
              info = " ",
              hint = " ",
            },
          },
        },
        lualine_c = {
          {
            function()
              local navic = require("nvim-navic")
              local ret = navic.get_location()
              return ret:len() > 2000 and "navic error" or ret
            end,
            cond = function()
              if package.loaded["nvim-navic"] then
                local navic = require("nvim-navic")
                return navic.is_available()
              end
            end,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_x = {
          { "filetype", icon_only = true },
          { "encoding" },
        },
        lualine_y = {
          "progress",
          {
            function()
              local buf_client_names = {}
              local bufnr = vim.api.nvim_get_current_buf()
              local ft = vim.bo.filetype
              local buf_clients = vim.lsp.get_active_clients({ buffer = bufnr })
              for _, client in pairs(buf_clients) do
                if vim.tbl_contains(client.config.filetypes, ft) then
                  table.insert(buf_client_names, client.name)
                end
              end

              return "[" .. table.concat(buf_client_names, ", ") .. "]"
            end,
            icon = " LSP:",
            color = { gui = "bold" },
          },
        },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    })
  end,
}

