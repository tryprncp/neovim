return {
  {
    'nvimdev/dashboard-nvim',
    lazy = false,
    opts = function()
      local logo = [[
_____  ___    _______    ______  ___      ___  __     ___      ___
(\"   \|"  \  /"     "|  /    " \|"  \    /"  ||" \   |"  \    /"  |
|.\\   \    |(: ______) // ____  \\   \  //  / ||  |  |\   \  //   |
|: \.   \\  | \/    |  /  /    ) :)\\  \/. ./  |:  |  | \\  \/.    |
|.  \    \. | // ___)_(: (____/ //  \.    //   |.  |  |: \.        |
|    \    \ |(:      "|\        /    \\   /    /\  |\ |.  \    /:  |
 \___|\____\) \_______) \"_____/      \__/    (__\_|_)|___|\__/|___|

https://github.com/tryprncp/neovim
      ]]

      logo = string.rep('\n', 15) .. logo .. '\n\n'

      local opts = {
        theme = 'doom',
        hide = {
          statusline = true,
        },
        config = {
          header = vim.split(logo, '\n'),
          center = {
            { action = 'Oil', desc = ' Open file explorer', icon = ' ', key = '\\' },
            { action = 'e $MYVIMRC', desc = ' Edit neovim config', icon = '󰈮 ', key = 'e' },
            { action = 'Mason', desc = ' Mason', icon = '󱘊 ', key = 'm' },
            { action = 'Lazy', desc = ' Lazy', icon = '󰒲 ', key = 'l' },
            { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
          },
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return { '⚡ Neovim loaded ' .. stats.loaded .. '/' .. stats.count .. ' plugins in ' .. ms .. 'ms' }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
        button.key_format = '  %s'
      end

      return opts
    end,
  },

  { -- Text colorizer
    'norcalli/nvim-colorizer.lua',
    event = { 'BufNewFile', 'BufReadPre' },
    config = function()
      require('colorizer').setup()
    end,
  },

  { -- Markdown preview
    'OXY2DEV/markview.nvim',
    ft = 'markdown',
  },

  { -- Main colorscheme
    'folke/tokyonight.nvim',
    opts = {
      transparent = true,
      styles = {
        sidebars = 'transparent',
        floats = 'transparent',
      },
    },
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'tokyonight-night'
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'echasnovski/mini.indentscope',
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = 'VeryLazy',
    opts = {
      symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = {
          'alpha',
          'dashboard',
          'fzf',
          'help',
          'lazy',
          'lazyterm',
          'mason',
          'notify',
          'toggleterm',
          'Trouble',
          'trouble',
        },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },

  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    event = 'VeryLazy',
    main = 'ibl',
    opts = {
      scope = {
        enabled = false,
      },
      exclude = {
        filetypes = {
          'dashboard',
        },
      },
    },
  },
}
