return {

  {
    'tpope/vim-fugitive',
    cmd = 'Git',
    event = 'BufReadPre',
    keys = {
      { '<leader>gs', '<cmd>Git<cr>', desc = 'Open git window' },
    },
  },

  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function set(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- function to refresh the vim-fugitive window
        local function reload_fugitive_index()
          for _, buf in ipairs(vim.api.nvim_list_bufs()) do
            local bufname = vim.api.nvim_buf_get_name(buf)
            if vim.startswith(bufname, 'fugitive://') and string.find(bufname, '.git//') then
              vim.api.nvim_buf_call(buf, function()
                vim.cmd.edit()
              end)
            end
          end
        end

        -- Git actions
        -- visual mode
        set('v', '<leader>ga', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
          reload_fugitive_index()
        end, { desc = 'stage git hunk' })

        set('v', '<leader>gr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
          reload_fugitive_index()
        end, { desc = 'reset git hunk' })

        -- normal mode
        set('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'go to next hunk' })

        set('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'go to previous hunk' })

        set('n', '<leader>ga', function()
          gitsigns.stage_hunk()
          reload_fugitive_index()
        end, { desc = 'git stage hunk' })

        set('n', '<leader>gA', function()
          gitsigns.stage_buffer()
          reload_fugitive_index()
        end, { desc = 'git stage buffer' })

        set('n', '<leader>gu', function()
          gitsigns.undo_stage_hunk()
          reload_fugitive_index()
        end, { desc = 'git [u]ndo staged hunk' })

        set('n', '<leader>gU', function()
          gitsigns.reset_buffer_index()
          reload_fugitive_index()
        end, { desc = 'git [U]ndo all staged hunks' })

        set('n', '<leader>gr', function()
          gitsigns.reset_hunk()
          reload_fugitive_index()
        end, { desc = 'git [r]eset hunk' })

        set('n', '<leader>gR', function()
          gitsigns.reset_buffer()
          reload_fugitive_index()
        end, { desc = 'git [R]eset buffer' })

        set('n', '<leader>gD', function()
          gitsigns.diffthis '@'
        end, { desc = 'git [D]iff against last commit' })

        set('n', '<leader>gd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
        set('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
        set('n', '<leader>gb', gitsigns.blame_line, { desc = 'git [b]lame line' })

        -- Toggles
        set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
        set('n', '<leader>td', gitsigns.toggle_deleted, { desc = '[T]oggle git show [D]eleted' })
      end,
    },
  },
}
