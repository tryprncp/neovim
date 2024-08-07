return {

  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },

  { 'Bilal2453/luvit-meta', lazy = true },

  { -- "gc" to comment visual regions/lines
    'numToStr/Comment.nvim',
    event = 'InsertEnter',
  },

  { -- Helpful plugin for visualizing undotree
    'mbbill/undotree',
    keys = {
      { '<leader>u', '<cmd>UndotreeToggle<cr>', desc = 'Toggle undotree' },
    },
  },

  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'UIEnter',
    config = function()
      require('which-key').setup {
        preset = 'modern',
      }
      require('which-key').add {
        { '<leader>c', group = '[C]ode' },
        { '<leader>d', group = '[D]ocument' },
        { '<leader>r', group = '[R]ename' },
        { '<leader>s', group = '[S]earch' },
        { '<leader>w', group = '[W]orkspace' },
        { '<leader>t', group = '[T]oggle' },
        { '<leader>g', group = '[G]it operations', mode = { 'n', 'v' } },
      }
    end,
  },

  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    lazy = true,
    event = 'UIEnter',
    config = function()
      require('mini.misc').setup()
      require('mini.hipatterns').setup {
        highlighters = {
          fixme = { pattern = 'FIXME', group = 'MiniHipatternsFixme' },
          hack = { pattern = 'HACK', group = 'MiniHipatternsHack' },
          todo = { pattern = 'TODO', group = 'MiniHipatternsTodo' },
          note = { pattern = 'NOTE', group = 'MiniHipatternsNote' },
        },
      }
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  { -- Helpful plugin for seamless navigation between tmux panes and neovim windows.
    -- Should have the same plugin installed on tmux.
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
    },
  },

  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    lazy = true,
    event = 'UIEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        defaults = {
          mappings = {
            i = { ['<c-enter>'] = 'to_fuzzy_refine' },
          },
        },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local builtin = require 'telescope.builtin'
      local set = vim.keymap.set
      set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
      set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      -- Slightly advanced example of overriding default behavior and theme
      set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- It's also possible to pass additional configuration options.
      set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  {
    'stevearc/oil.nvim',
    event = 'UIEnter',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('oil').setup {
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = false,
        },
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
      }
      vim.keymap.set('n', '\\', '<cmd>Oil<cr>', { desc = 'Open file manager' })
    end,
  },
}
