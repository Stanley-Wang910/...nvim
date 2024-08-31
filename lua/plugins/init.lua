return {
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   enabled = false,
  -- },
  {
    "onsails/lspkind.nvim",
  },

  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  require "plugins.vim-tmux-nav",
  require "plugins.tabout",
  require "plugins.surround",
  require "plugins.ui",

  require "plugins.undotree",
  require "plugins.git",
  require "plugins.lsp",
  require "plugins.autocomplete",
  require "plugins.python",
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
