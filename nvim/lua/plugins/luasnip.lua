return {
  "L3MON4D3/LuaSnip",
  config = function()
    local luasnip = require("luasnip")
    local types = require("luasnip.util.types")
    luasnip.config.set_config({
      history = false, -- keep aroud last snippet local to jump back
      updateevents = "TextChanged, TextChangedI", -- update changes as you type
      delete_check_events = "TextChanged,TextChangedI",
      region_check_events = "CursorMoved",
      enable_autosnippets = true,
      ext_opts = {
        [types.insertNode] = {
          passive = {
            hl_group = "GruvboxRed",
          },
        },
        [types.choiceNode] = {
          active = {
            virt_text = { { "choiceNode", "GruvboxOrange" } },
          },
        },
        [types.textNode] = {
          passive = {
            hl_group = "GruvboxGreen",
          },
        },
      },
      ext_base_prio = 200,
      ext_prio_increase = 3,
    })

    require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/snippets" })
  end,
}

