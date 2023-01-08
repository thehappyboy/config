local M = {
  "monaqa/dial.nvim",
  keys = {
    {
      "<c-a>",
      function()
        return require("dial.map").inc_normal()
      end,
      expr = true,
    },
    {
      "<c-x>",
      function()
        return require("dial.map").dec_normal()
      end,
      expr = true,
    },
  },
}

M.config = function()
  local augend = require("dial.augend")
  require("dial.config").augends:register_group({
    default = {
      augend.integer.alias.decimal,
      augend.integer.alias.hex,
      augend.date.alias["%Y/%m/%d"],
      augend.constant.alias.bool,
      augend.semver.alias.semver,
    },
  })
end

return M