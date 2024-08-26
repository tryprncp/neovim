local set = vim.keymap.set

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
set({ 'n', 'v' }, '<Space>', '<Nop>')

set({ 'n', 'v' }, '<leader>z', '<cmd>lua MiniMisc.zoom()<cr>', { desc = 'Zoom current window' })
set('n', '<leader>x', '<cmd>!chmod +x %<cr>', { desc = 'make this file executable', silent = true })
set('n', '<C-c>', '<cmd>nohlsearch<cr>')

-- Helpful keymap in vertical edit mode
set('i', '<C-c>', '<Esc>')

-- Disable the worst key
set('n', 'Q', '<nop>')

-- Delete the line below and move the cursor to the left
set('n', 'J', "mzJ'z")

-- Toggles
set('n', '<leader>tn', '<cmd>set invrelativenumber<cr>', { desc = 'Toggle relative line number' })
set('n', '<leader>tw', '<cmd>set invwrap<cr>', { desc = 'Toggle line wrap' })

-- Keymaps for diffget. Useful when resolving conflicts
set('n', 'gh', '<cmd>diffget //2<cr>')
set('n', 'gl', '<cmd>diffget //3<cr>')

-- Move highlighted region up and down
set('v', 'J', ":m '>+1<cr>gv=gv")
set('v', 'K', ":m '<-2<cr>gv=gv")

-- Stay in visual mode when indenting
set('v', '<', '<gv')
set('v', '>', '>gv')

-- Jump to previous/next item in quickfix/location list
set('n', '<leader>k', '<cmd>lprev<cr>zz', { desc = 'Previous item in location list' })
set('n', '<leader>j', '<cmd>lnext<cr>zz', { desc = 'Next item in location list' })
set('n', '<leader>k', '<cmd>cprev<cr>zz', { desc = 'Previous item in qfixlist' })
set('n', '<leader>j', '<cmd>cnext<cr>zz', { desc = 'Next item in qfixlist' })

-- Centers the cursor within the window after jumping
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

-- Helpful for copy and paste
set('x', '<leader>p', '"_dP')
set('n', '<leader>y', '"+y')
set('v', '<leader>y', '"+y')
set('n', '<leader>Y', '"+Y')
set('n', '<leader>d', '"_d')
set('v', '<leader>d', '"_d')

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
