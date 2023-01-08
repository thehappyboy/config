local M = {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
}

local colors = {
  bg = "#202328",
  fg = "#bbc2cf",
  yellow = "#ECBE7B",
  cyan = "#008080",
  darkblue = "#081633",
  green = "#98be65",
  orange = "#FF8800",
  violet = "#a9a1e1",
  magenta = "#c678dd",
  blue = "#51afef",
  red = "#ec5f67",
}

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

M.config = function()
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
      lualine_a = {
        {
          function()
            return "▊"
          end,
          color = function()
            local mode_colors = {
              n = colors.red,
              i = colors.green,
              v = colors.blue,
              [""] = colors.blue,
              V = colors.blue,
              c = colors.magenta,
              no = colors.red,
              s = colors.orange,
              S = colors.orange,
              [""] = colors.orange,
              ic = colors.yellow,
              R = colors.violet,
              Rv = colors.violet,
              cv = colors.red,
              ce = colors.red,
              r = colors.cyan,
              rm = colors.cyan,
              ["r?"] = colors.cyan,
              ["!"] = colors.red,
              t = colors.red,
            }
            return { bg = "#504945", fg = mode_colors[vim.fn.mode()] }
          end,
          padding = { right = 0 },
        },
      },
      lualine_b = {
        { "b:gitsigns_head", icon = { "", color = { fg = "#f2891c" } } },
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
          get_env,
        },
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
end

return M
