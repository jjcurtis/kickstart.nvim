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
