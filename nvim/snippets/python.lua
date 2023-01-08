local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")

local snippets = {
  s("#!", {
    t("#!/usr/bin/env python3"),
  }),
  s("enc", {
    t("# -*- coding=utf-8 -*-"),
  }),
  ls.parser.parse_snippet(
    "if",
    [[
    if ${1:condition}:
        ${2:pass}
    ]]
  ),
  ls.parser.parse_snippet(
    "class",
    [[
    class ${1:classname}(${2:object}):
        ${3:pass}
    ]]
  ),
  ls.parser.parse_snippet(
    "for",
    [[
    for ${1:i} in ${2:iter}:
        ${3:pass}
    ]]
  ),
  ls.parser.parse_snippet(
    "while",
    [[
    while ${1:condition}:
        ${2:pass}
    ]]
  ),
  ls.parser.parse_snippet("raise", [[raise ${1:Value}Error('${2:msg}')]]),
  ls.parser.parse_snippet("from", [[from ${1:pkg} import ${2:module}]]),
  -- ls.parser.parse_snippet("from", [[from ${1:pkg} import ${2:module} as ${3:alias}]]),
  ls.parser.parse_snippet("imp", [[import ${1:pkg}]]),
  -- ls.parser.parse_snippet("imp", [[import ${1:pkg} as ${2:alias]]),
  ls.parser.parse_snippet(
    "doc",
    [[
    """
      ${1:description}

      Args:
      ${2:args}

      Returns:
      ${3:returns}
      """
      @0
    ]]
  ),
}

return snippets
