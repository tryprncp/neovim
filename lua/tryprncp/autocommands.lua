local custom = vim.api.nvim_create_augroup('custom', { clear = true })

-- Highlight when yanking (copying) text
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

-- Fix jumping between windows
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'netrw', 'markdown' },
  group = custom,
  callback = function()
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-h>', '<cmd>TmuxNavigateLeft<cr>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-j>', '<cmd>TmuxNavigateDown<cr>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-k>', '<cmd>TmuxNavigateUp<cr>', { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', '<C-l>', '<cmd>TmuxNavigateRight<cr>', { noremap = true, silent = true })
  end,
})

-- Equalize the size of windows
vim.api.nvim_create_autocmd({ 'VimResized', 'WinResized' }, {
  group = custom,
  callback = function()
    vim.cmd 'tabdo wincmd ='
  end,
})
