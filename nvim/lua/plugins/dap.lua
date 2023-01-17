return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "rcarriga/nvim-dap-ui",
  },
  init = function()
    vim.keymap.set("n", "<F3>", "<cmd>lua require'dap'.continue()<cr>")

    vim.keymap.set(
      "n",
      "<localleader>b",
      "<cmd>lua require'dap'.toggle_breakpoint()<cr>",
      { desc = "toggle breakpoint" }
    )
    vim.keymap.set("n", "<localleader>c", "<cmd>lua require'dap'.continue()<cr>", { desc = "continue" })
    vim.keymap.set("n", "<localleader>n", "<cmd>lua require'dap'.step_over()<cr>", { desc = "step_over" })
    vim.keymap.set("n", "<localleader>i", "<cmd>lua require'dap'.step_into()<cr>", { desc = "step_into" })
    vim.keymap.set("n", "<localleader>o", "<cmd>lua require'dap'.step_out()<cr>", { desc = "step_out" })
    vim.keymap.set("n", "<localleader>t", "<cmd>lua require'dap'.run_to_cursor()<cr>", { desc = "run_to_cursor" })
    vim.keymap.set("n", "<localleader>q", "<cmd>lua require'dap'.terminate()<cr>", { desc = "terminate" })
    vim.keymap.set("n", "<localleader>k", "<cmd>lua require'dap'.up()<cr>", { desc = "up callstack" })
    vim.keymap.set("n", "<localleader>j", "<cmd>lua require'dap'.down()<cr>", { desc = "down_callstack" })
    vim.keymap.set("n", "<localleader>w", "<cmd>lua require'dap.ui.widgets'.hover()<cr>", { desc = "info" })
    vim.keymap.set("n", "<localleader>r", "<cmd>lua require'dap'.repl.toggle()<cr>", { desc = "repl_toggle" })
    -- vim.keymap.set("n", "<localleader>q", "<cmd>lua require'dap'.down()<cr>", { desc = "down_callstack" })
    vim.keymap.set(
      "n",
      "<localleader>?",
      "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<cr>",
      { desc = "scopes" }
    )
  end,
  config = function()
    local dap = require("dap")

    dap.adapters.python = {
      type = "executable",
      command = "debugpy-adapter",
    }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        -- args =
        justMyCode = false,
        stopOnEntry = true,
        pythonPath = require("utils").get_python_path,
      },
    }

    local dapui = require("dapui")
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open({})
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close({})
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close({})
    end
  end,
}
