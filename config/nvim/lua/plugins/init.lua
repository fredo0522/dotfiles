--
-- Check if lazy is installed, if not cloned it from github
--
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
  ui = { border = "rounded" },
  performance = {
    rtp = {
      paths = { vim.fn.stdpath("data") .. "/site" },
      disabled_plugins = {
        'gzip',
        'tohtml',
        'matchit',
        'rplugin',
        'tarPlugin',
        'zipPlugin',
        'netrwPlugin',
        'tutor',
			},
    }
  }
}

--
-- Plugin list
--
return require('lazy').setup({
  --
  -- Navigation
  --

  -- Comment lines more easily and motions
  {
    'numToStr/Comment.nvim',
    keys = {
      { "gcc" }, { "gbc" }, { "gc", mode = "v" }, { "gb", mode = "v" }
    },
    config = function()
      local integration = require('ts_context_commentstring.integrations.comment_nvim')
      require('Comment').setup({
        ignore = '^$', -- ignore empty lines
        pre_hook = integration.create_pre_hook()
      })
    end
  },

  -- Easy navigation between lines with 's' and motions
  {
    "ggandor/leap.nvim",
    keys = {
      { "gs", "<Plug>(leap-from-window)" },
      { "s", "<Plug>(leap-forward-to)" },
      { "S", "<Plug>(leap-backward-to)" },
      { mode = "x", "x", "<Plug>(leap-forward-to)" },
      { mode = "x", "X", "<Plug>(leap-backward-to)" },
    },
  },

  -- Motions between parenthesis, brackets, etc...
  {
    "kylechui/nvim-surround",
    keys = {
      { "ys" }, { "cs" }, { "ds" }, { "gs", mode = "v" }
    },
    opts = { keymaps = { visual = "gs" } }
  },

  -- Navigation between tmux and nvim
  {
    "numToStr/Navigator.nvim",
    cmd = {
      "NavigatorLeft", "NavigatorRight",
      "NavigatorUp", "NavigatorDown"
    },
    opts = { auto_save = 'current' }
  },

  -- '.' command for repeating macros with plugins
  { "tpope/vim-repeat", keys = { "." } },

  --
  -- UI Plugins
  --

  -- Theme
  {
    "norcalli/nvim-base16.lua",
    lazy = false,
    priority = 1000,
    dependencies = "norcalli/nvim.lua",
    config = function() require "plugins.configs.theme" end
  },

  -- Icons for patch fonts
  {
    "kyazdani42/nvim-web-devicons",
    event = "VeryLazy",
    config = function() require "plugins.configs.devicons" end
  },

  -- Improve the default vim.ui, cmdline and search interfaces
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    config = function() require "plugins.configs.noice" end
  },

  -- Improve default notifications
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    opts = {
      render = "compact",
      stages = "slide",
      timeout = 3500,
      icons = {
        DEBUG = "",
        ERROR = "",
        INFO = "",
        TRACE = "✎",
        WARN = "",
      }
    }
  },

  -- Buffer list on top of the screen
  {
    "akinsho/nvim-bufferline.lua",
    event = "VeryLazy",
    version = "3.*",
    dependencies = { "tiagovla/scope.nvim", config = true },
    config = function() require "plugins.configs.bufferline" end
  },

  -- Indentation guides/tracking
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    after = "nvim-treesitter/nvim-treesitter",
    config = function() require "plugins.configs.blankline" end
  },

  -- Smooth scrolling
  {
    "karb94/neoscroll.nvim",
    keys = {
      '<C-u>', '<C-d>', '<C-b>', '<C-f>',
      '<C-y>', '<C-e>', 'zt', 'zz', 'zb'
    },
    config = function() require "plugins.configs.neoscroll" end
  },

  -- Color highlighter for hex, rgb, etc...
  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    opts = {
      user_default_options = {
        names = false,
        tailwind = true,
        mode = "virtualtext",
        virtualtext = "■"
      }
    }
  },

  --
  -- Find files
  --

  -- Tree view of the current directory
  {
    "kyazdani42/nvim-tree.lua",
    keys = {
      { "<leader>t", "<cmd>NvimTreeToggle<cr>", desc = "[t]ree view" }
    },
    config = function() require "plugins.configs.nvim-tree" end
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    cmd = "Telescope",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        cond = vim.fn.executable 'make' == 1,
        build = 'make'
      }
    },
    config = function() require "plugins.configs.telescope" end
  },

  --
  -- Git
  --
  {
    "tpope/vim-fugitive",
    keys = {
      { "<leader>g", "<cmd>vert Git<cr>", desc = "[g]it view" }
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    dependencies = "nvim-lua/plenary.nvim",
    config = function() require "plugins.configs.gitsigns" end
  },

  --
  -- LSP (Language Server Protocol)
  --
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "williamboman/mason.nvim", config = true },
      "williamboman/mason-lspconfig.nvim"
    },
    config = function() require "plugins.configs.lspconfig" end
  },

  -- Autocompletion/Snippets
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "onsails/lspkind-nvim", -- icons in completion menu
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      { "L3MON4D3/LuaSnip", version = "1.*" }, -- snippets engine
      "saadparwaiz1/cmp_luasnip",              -- integrations
      "rafamadriz/friendly-snippets",          -- snippet collection
    },
    config = function() require "plugins.configs.completion" end
  },

  -- Autocomplete parenthesis, brackets, etc...
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    after = { "nvim-treesitter/nvim-treesitter", "hrsh7th/nvim-cmp" },
    config = function() require "plugins.configs.autopairs" end
  },

  --
  -- Treesitter (syntax highlight, autopairs and comment strings)
  --
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    dependencies = {
      "nvim-treesitter/playground",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function() require "plugins.configs.treesitter" end,
  },

  --
  -- Latex integration
  --
  {
    "lervag/vimtex",
    ft = "tex",
    config = function()
      vim.g.tex_flavor = 'latex'
      vim.g.tex_conceal = 'abdmg'
      vim.g.vimtex_quickfix_mode = 0
    end
  },
  {
    "iurimateus/luasnip-latex-snippets.nvim",
    ft = "tex",
    after = { "L3MON4D3/LuaSnip", "lervag/vimtex" },
    config = true
  },
}, lazy_opts)
