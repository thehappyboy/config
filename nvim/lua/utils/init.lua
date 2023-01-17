_G.dump = function(...)
  print(vim.inspect(...))
end

local M = {}

function M.toggle(option, silent)
  local info = vim.api.nvim_get_option_info(option)
  local scopes = { buf = "bo", win = "wo", global = "o" }
  local scope = scopes[info.scope]
  local options = vim[scope]
  options[option] = not options[option]

  if silent ~= true then
    if options[option] then
      M.info("Enable vim." .. scope .. "." .. option, "Toggle")
    else
      M.info("Disable vim." .. scope .. "." .. option, "Toggle")
    end
  end
end

function M.warn(msg, name)
  vim.notify(msg, vim.log.levels.WARN, { title = name })
end

function M.error(msg, name)
  vim.notify(msg, vim.log.levels.ERROR, { title = name })
end

function M.info(msg, name)
  vim.notify(msg, vim.log.levels.INFO, { title = name })
end

function M.get_python_path()
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then
    return string.format("%s/bin/python", venv)
  else
    return "python3"
  end
end

function M.on_attach(on_attach)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local buffer = args.buf
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      on_attach(client, buffer)
    end,
  })
end

-- @param name string
function M.opts(name)
  local plugin = require("lazy.core.config").plugins[name]
  if not plugin then
    return {}
  end
  local Plugin = require("lazy.core.plugin")
  return Plugin.values(plugin, "opts", false)
end

function M.if_has(plugin_name, callback, default)
  local has, plugin = pcall(require, plugin_name)
  if has then
    return callback(plugin)
  else
    if default ~= nil then
      return default()
    end
  end
end

return M
