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
    return "/usr/bin/python3"
  end
end

return M

