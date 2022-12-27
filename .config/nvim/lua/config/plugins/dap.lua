local M = {
  "mfussenegger/nvim-dap",
}

function M.config()
  local dap = require("dap")

  local enrich_config = function(config, on_config)
    local input = vim.split(vim.fn.input("> ", "", "file"), " ")
    config.program = vim.fn.getcwd() .. "/" .. input[1]
    table.remove(input, 1)
    config.args = input
    on_config(config)
  end

  dap.defaults.fallback.terminal_win_cmd = "12new"

  dap.adapters.cppdbg = function(cb, config)
    cb({
      id = "cppdbg",
      type = "executable",
      command = "OpenDebugAD7",
      enrich_config = enrich_config,
    })
  end
  dap.adapters.python = {
    id = "python",
    type = "executable",
    command = "debugpy-adapter",
  }

  dap.configurations.cpp = {
    {
      name = "C++: launch file",
      type = "cppdbg",
      request = "launch",
      cwd = "${workspaceFolder}",
      stopAtEntry = true,
      setupCommands = {  
        { 
           text = '-enable-pretty-printing',
           description =  'enable pretty printing',
           ignoreFailures = false,
        },
      },
    },
  }
  dap.configurations.c = dap.configurations.cpp

  local venv_path = os.getenv('VIRTUAL_ENV') or os.getenv('CONDA_PREFIX')
  dap.configurations.python = {
    {
      name = "Python: launch file",
      type = "python",
      request = "launch",
      program = "${file}",
      pythonPath = venv_path and (venv_path .. "/bin/python3") or "/usr/bin/python3",
      stopOnEntry = true,
      justMyCode = false,
    },
  }

  vim.fn.sign_define('DapBreakpoint', {text='', texthl='debugBreakpoint', linehl='', numhl=''})
  vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='debugBreakpointCondition', linehl='', numhl=''})
  vim.fn.sign_define('DapStopped', {text='', linehl='debugPC', numhl=''})
end

return M

