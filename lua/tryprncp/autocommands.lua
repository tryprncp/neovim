-- [[ AUTOCOMMANDS ]]
--  See `:help lua-guide-autocommands`

-- Create augroup
local custom = vim.api.nvim_create_augroup('custom', { clear = true })

-- Highlight when yanking (copying) text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = custom,
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Remove trailing whitespace
vim.api.nvim_create_autocmd('BufWritePre', {
  desc = 'Remove trailing whitespace',
  group = custom,
  callback = function()
    vim.cmd [[:%s/\s\+$//e]]
  end,
})
