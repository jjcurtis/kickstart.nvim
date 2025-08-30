vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Toggle Neotree
vim.keymap.set('n', '<leader>n', function()
  vim.cmd 'Neotree toggle'
end, { desc = 'Toggle [N]eotree' })

-- Open NeoGit
vim.keymap.set('n', '<leader>g', function()
  vim.cmd 'Neogit'
end, { desc = 'Neo[G]it' })

-- Toggle terminal
vim.keymap.set({ 'n', 't' }, '<C-t>', function()
  vim.cmd 'ToggleTerm'
end, { desc = 'Toggle Terminal' })

-- Change Directory
vim.keymap.set('n', '<leader>c', function()
  vim.ui.input({
    prompt = 'New working directory: ',
    completion = 'dir',
  }, function(input)
    if input and input ~= '' then
      local success, err = pcall(function()
        vim.api.nvim_set_current_dir(input)
      end)
      if not success then
        vim.notify('Failed to change directory: ' .. err, vim.log.levels.ERROR)
      else
        vim.notify('Changed working directory to: ' .. input)
      end
    end
  end)
end, { desc = 'Change working directory' })

vim.keymap.set('n', '<leader>b', function()
  vim.cmd 'DapToggleBreakpoint'
end, { desc = 'Toggle [B]reakpoint' })

vim.keymap.set('n', '<F5>', function()
  vim.cmd 'DapContinue'
end)

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
