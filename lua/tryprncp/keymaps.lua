--[[ KEYMAPS ]]
-- See :help vim.keymap

-- Delete the line below and move the cursor to the left
vim.keymap.set('n', 'J', "mzJ'z")

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
