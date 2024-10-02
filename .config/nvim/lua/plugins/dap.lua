return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    {
      "<leader>db",
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = "Toggle Breakpoint",
    },
    {
      "<leader>dc",
      function()
        require('dap').continue()
      end,
      desc = "Continue Debug Session",
    },
    {
      "<leader>dd",
      function()
        require('dap').down()
      end,
      desc = "Jump Down on Stack",
    },
    {
      "<leader>di",
      function()
        require('dap').step_into()
      end,
      desc = "Step Into",
    },
    {
      "<leader>dr",
      function()
        require('dap').restart()
      end,
      desc = "Restart Debug Session",
    },
    {
      "<leader>ds",
      function()
        require('dap').step_over()
      end,
      desc = "Step Over",
    },
    {
      "<leader>dS",
      function()
        require('dap').step_out()
      end,
      desc = "Step Out",
    },
    {
      "<leader>du",
      function()
        require('dap').up()
      end,
      desc = "Jump Up on Stack",
    },
    {
      "<leader>dv",
      function()
        require('dapui').toggle()
      end,
      desc = "Toggle DAP UI Widgets",
    },
    {
      "<leader>dx",
      function()
        require('dap').terminate()
      end,
      desc = "Terminate Session",
    },
  },
  config = function()
    local dap = require('dap')
    local dapui = require("dapui")

    dap.adapters.codelldb = {
      type = "server",
      port = "13000",
      executable = {
        command = "codelldb",
        args = {"--port", "13000"},
      },
    }
    dap.configurations.cpp = {
      {
        name = "Launch file",
        type = "codelldb",
        request = "launch",
        cwd = '${workspaceFolder}',
        program = function()
          require("telescope")
          local pickers = require("telescope.pickers")
          local finders = require("telescope.finders")
          local conf = require("telescope.config").values
          local actions = require("telescope.actions")
          local action_state = require("telescope.actions.state")
          return coroutine.create(function(coro)
            pickers
              .new({}, {
                prompt_title = "Path to executable",
                finder = finders.new_oneshot_job({ "fd", "--hidden", "--no-ignore", "--type", "x" }, {}),
                sorter = conf.generic_sorter({}),
                attach_mappings = function(buffer_number)
                  actions.select_default:replace(function()
                    actions.close(buffer_number)
                    coroutine.resume(coro, action_state.get_selected_entry()[1])
                  end)
                  return true
                end,
              })
              :find()
          end)
        end,
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

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.fn.sign_define('DapBreakpoint', {text='', texthl='debugBreakpoint', linehl='', numhl=''})
    vim.fn.sign_define('DapBreakpointCondition', {text='', texthl='debugBreakpointCondition', linehl='', numhl=''})
    vim.fn.sign_define('DapStopped', {text='', linehl='debugPC', numhl=''})
  end,
}
