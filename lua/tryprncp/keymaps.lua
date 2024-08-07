local set = vim.keymap.set

-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
set({ 'n', 'v' }, '<Space>', '<Nop>')

set({ 'n', 'v' }, '<leader>z', '<cmd>lua MiniMisc.zoom()<cr>', { desc = 'Zoom current window' })
set('n', '<leader>x', '<cmd>!chmod +x %<cr>', { silent = true })
set('n', '<C-c>', '<cmd>nohlsearch<cr>')

-- Helpful keymap in vertical edit mode
set('i', '<C-c>', '<Esc>')

-- Disable the worst key
set('n', 'Q', '<nop>')

-- Delete the line below and move the cursor to the left
set('n', 'J', "mzJ'z")

-- Toggles
set('n', '<leader>ln', '<cmd>set invrelativenumber<cr>', { desc = 'Toggle relative line number' })
set('n', '<leader>lw', '<cmd>set invwrap<cr>', { desc = 'Toggle line wrap' })

-- Keymaps for diffget. Useful when resolving conflicts
set('n', 'gh', '<cmd>diffget //2<cr>')
set('n', 'gl', '<cmd>diffget //3<cr>')

-- Move highlighted region up and down
set('v', 'J', ":m '>+1<cr>gv=gv")
set('v', 'K', ":m '<-2<cr>gv=gv")

-- Stay in indent mode
set('v', '<', '<gv')
set('v', '>', '>gv')

-- Navigate between location list items
set('n', '<leader>k', '<cmd>lnext<cr>zz', { desc = 'Next item in location list' })
set('n', '<leader>j', '<cmd>lprev<cr>zz', { desc = 'Previous item in location list' })

-- Navigate between quickfix list items
set('n', '<leader>k', '<cmd>cnext<cr>zz', { desc = 'Next item in qfixlist' })
set('n', '<leader>j', '<cmd>cprev<cr>zz', { desc = 'Previous item in qfixlist' })

-- Centers the cursor within the window after jumping
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

-- Netrw
vim.g.netrw_banner = 0
set({ 'n', 'v' }, '\\', '<cmd>Lexplore<cr>', { desc = 'Toggle filetree' })
set('n', '<leader>fe', '<cmd>Explore<cr>', { desc = 'Open Netrw' })
vim.g.netrw_winsize = 15
vim.g.netrw_liststyle = 3

-- Helpful for copy and paste
set('x', '<leader>p', '"_dP')
set('n', '<leader>y', '"+y')
set('v', '<leader>y', '"+y')
set('n', '<leader>Y', '"+Y')
set('n', '<leader>d', '"_d')
set('v', '<leader>d', '"_d')

-- Keymaps for tabpages
set('n', '<s-t>', '<cmd>tabnew<cr>', { desc = 'New tabpage' })
set('n', '<s-c>', '<cmd>tabclose<cr>', { desc = 'Close current tabpage' })
set('n', '<s-x>', '<cmd>tabonly<cr>', { desc = 'Close all other tabpages' })
set('n', '<s-h>', '<cmd>tabp<cr>', { desc = 'Go to previous tabpage' })
set('n', '<s-l>', '<cmd>tabn<cr>', { desc = 'Go to next tabpage' })

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
