return function()
  local ok, wk = pcall(require, "which-key")
  if not ok then
    return
  end

  wk.register({
    { c = "<cmd>Neorg gtd capture", "capture" },
    { e = "<cmd>Neorg gtd edit", "edit" },
    { v = "<cmd>Neorg gtd views", "views" },
    { n = "<cmd>Neorg news all", "news" },
    { p = "<cmd>Neorg presenter start", "start" },
    { P = "<cmd>Neorg presenter close", "close" },
    { w = "<cmd>Neorg workspaces", "workspaces" },
  }, { prefix = "<localleader>", buffer = 0 })
end

