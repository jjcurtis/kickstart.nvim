vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Run Neotree on startup',
  group = vim.api.nvim_create_augroup('neotree-startup', { clear = true }),
  callback = function()
    if vim.fn.expand '%:t' == '' then
      vim.cmd 'Neotree current'
    end
  end,
})

vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Setup DAP-UI',
  group = vim.api.nvim_create_augroup('dapui-setup', { clear = true }),
  callback = function()
    local dap, dapui = require 'dap', require 'dapui'
    dapui.setup()
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
  end,
})
