local M = {
  "anuvyklack/hydra.nvim",
  event = "VeryLazy",
  
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-telescope/telescope.nvim",
  },
}

function M.config()
  local hydra = require('hydra')
  local cmd = require('hydra.keymap-util').cmd
  local dap = require('dap')
  local dap_ui = require('dap.ui.widgets')
  local gitsigns = require('gitsigns')
  local diffview = require('diffview')

  local dap_hint = [[
   ^ ^ Navigation      ^ ^     Action           ^ ^       UI      
   ^-^--------------   ^-^-------------------   ^-^----------------- 
   _s_: step into     _b_: toggle breakpoint   _o_: open repl 
   _S_: step out      _B_: conditional         _e_: eval
   _n_: step over     _c_: continue            _f_: frames
   _u_: prev frame ↑   _C_: clear breakpoints   _v_: variables
   _d_: next frame ↓   _x_: terminate           _L_: list breakpoints 

   _q_: quit
  ]]

  local git_hint = [[
   ^ ^    DiffView       ^ ^               Actions               
   ^-^----------------   ^-^-----------------^-^-----------------
   _h_: file history     _n_: next hunk      _u_: undo stage hunk
   _H_: branch history   _p_: prev hunk      _b_: blame line     
   _o_: staged diff      _s_: stage hunk     _B_: blame full
   _O_: diff revision    _S_: stage buffer   _d_: toggle deleted
   _c_: close diff

   _q_: quit
  ]]

  hydra({
    name = 'dap',
    hint = dap_hint,
    config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
        type = 'window',
        border = 'rounded',
      },
    },
    mode = {'n'},
    body = '<leader>d',
    heads = {
      {'S', dap.step_out, { desc = 'step out' }},
      {'n', dap.step_over, { desc = 'step over' }},
      {'s', dap.step_into, { desc = 'step into' }},
      {'b', dap.toggle_breakpoint, { desc = 'toggle breakpoint' }},
      {'B', function()
        dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
      end, { desc = 'conditional breakpoint' }},
      {'C', dap.clear_breakpoints, { desc = 'clear breakpoints' }},
      {'c', dap.continue, { desc = 'continue' }},
      {'x', dap.terminate, { desc = 'terminate' }},
      {'o', cmd "lua require'dap'.repl.open({}, 'botright 60vsplit')<cr><C-w>li", { desc = 'open repl' }},
      {'d', dap.down, { desc = 'next frame' }},
      {'u', dap.up, { desc = 'prev frame' }},
      {'e', dap_ui.hover, { desc = 'eval' }},
      {'f', cmd 'Telescope dap frames', { desc = 'frames' }},
      {'v', cmd 'Telescope dap variables', { desc = 'variables' }},
      {'L', cmd 'Telescope dap list_breakpoints', { desc = 'list breakpoints' }},
      {'q', nil, { exit = true, nowait = true, desc = 'quit' }}
    }
  })

  hydra({
    name = 'git',
    hint = git_hint,
    config = {
      buffer = bufnr,
      color = 'pink',
      invoke_on_body = true,
      hint = {
        type = 'window',
        border = 'rounded',
      },
      on_enter = function()
        -- vim.cmd 'mkview'
        -- vim.cmd 'silent! %foldopen!'
        vim.bo.modifiable = false
        gitsigns.toggle_signs(true)
        gitsigns.toggle_linehl(true)
      end,
      on_exit = function()
        local cursor_pos = vim.api.nvim_win_get_cursor(0)
        -- vim.cmd 'loadview'
        vim.api.nvim_win_set_cursor(0, cursor_pos)
        vim.cmd 'normal zv'
        gitsigns.toggle_signs(false)
        gitsigns.toggle_linehl(false)
        gitsigns.toggle_deleted(false)
      end,
    },
    mode = {'n', 'x'},
    body = '<leader>g',
    heads = {
      {'n', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gitsigns.next_hunk() end)
        return '<Ignore>'
       end, { expr = true, desc = 'next hunk' }},
      {'p', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gitsigns.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true, desc = 'prev hunk' }},
      {'s', function()
        local mode = vim.api.nvim_get_mode().mode:sub(1,1)
        if mode == 'V' then -- visual-line mode
          local esc = vim.api.nvim_replace_termcodes('<Esc>', true, true, true)
           vim.api.nvim_feedkeys(esc, 'x', false) -- exit visual mode
           vim.cmd("'<,'>Gitsigns stage_hunk")
        else
          vim.cmd("Gitsigns stage_hunk")
        end
      end, { desc = 'stage hunk' }},
      {'S', gitsigns.stage_buffer, { desc = 'stage buffer' }},
      {'u', gitsigns.undo_stage_hunk, { desc = 'undo stage' }},
      {'d', gitsigns.toggle_deleted, { nowait = true, desc = 'toggle deleted' }},
      {'b', gitsigns.blame_line, { desc = 'blame' }},
      {'B', function() gitsigns.blame_line{ full = true } end, { desc = 'blame full' }},
      {'c', cmd 'DiffviewClose', { desc = 'close diff' }},
      {'h', cmd 'DiffviewFileHistory %', { exit = true, desc = 'file history' }},
      {'H', cmd 'DiffviewFileHistory', { exit = true, desc = 'branch history' }},
      {'o', cmd 'DiffviewOpen', { exit = true, desc = 'curr diff' }},
      {'O', function()
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")
        local builtin = require("telescope.builtin")

        local opts = {
          attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              vim.cmd('DiffviewOpen ' .. selection.value)
            end)
            return true
          end,
        }
        builtin.git_commits(opts)
      end, { exit = true, desc = 'diff rev' }},
      {'q', nil, { exit = true, nowait = true, desc = 'quit' }}
    }
  })
end

return M

