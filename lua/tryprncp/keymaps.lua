--[[ KEYMAPS ]]
-- See :help vim.keymap

-- Toggle relative line number
vim.keymap.set('n', '<leader>ln', '<cmd>set invrelativenumber<cr>', { desc = 'Toggle relative line number' })

-- Toggle line wrap
vim.keymap.set('n', '<leader>lw', '<cmd>set invwrap<cr>', { desc = 'Toggle line wrap' })

-- Helpful keymap in vertical edit mode
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Netrw
vim.g.netrw_banner = 0
vim.keymap.set({ 'n', 'v' }, '\\', '<cmd>Lexplore<cr>', { desc = 'Toggle filetree' })
vim.keymap.set('n', '<leader>fe', '<cmd>Explore<cr>', { desc = 'Open Netrw' })
vim.g.netrw_winsize = 15
vim.g.netrw_liststyle = 3

-- Move highlighted region up and down
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv")

-- Zoom current window
vim.keymap.set({ 'n', 'v' }, '<leader>z', '<cmd>lua MiniMisc.zoom()<cr>', { desc = 'Zoom current window' })

-- Delete the line below and move the cursor to the left
vim.keymap.set('n', 'J', "mzJ'z")

-- Centers the cursor within the window after jumping
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Helpful for copy and paste
vim.keymap.set('x', '<leader>p', '"_dP')
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')
vim.keymap.set('n', '<leader>Y', '"+Y')
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

vim.keymap.set('n', 'Q', '<nop>')

-- Navigate between location list items
vim.keymap.set('n', '<leader>k', '<cmd>lnext<cr>zz', { desc = 'Next item in location list' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<cr>zz', { desc = 'Previous item in location list' })

-- Navigate between quickfix list items
vim.keymap.set('n', '<leader>k', '<cmd>cnext<cr>zz', { desc = 'Next item in qfixlist' })
vim.keymap.set('n', '<leader>j', '<cmd>cprev<cr>zz', { desc = 'Previous item in qfixlist' })

-- SpaceX to make executable file
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<cr>', { silent = true })

vim.keymap.set('n', '<C-c>', '<cmd>nohlsearch<cr>')
-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
