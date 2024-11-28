return {
	-- {
	--   "lewis6991/gitsigns.nvim",
	--   enabled = false,
	-- },
	require "plugins.oil",
	{
		"nvim-tree/nvim-tree.lua",
		-- enabled = false,
		config = function()
			require("nvim-tree").setup {
				git = {
					enable = true,
					ignore = false,
					timeout = 500,
				},
				respect_buf_cwd = true,
				update_focused_file = {
					enable = true,
					-- update_root = true,
				},
			}
		end,
	},

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
	require "plugins.rainbow_csv",
	-- require "plugins.cinnamon",
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			-- ensure_installed = {
			--   "vim",
			--   "lua",
			--   "vimdoc",
			--   "html",
			--   "css",
			-- },
			highlight = {
				disable = { "csv" },
			},
			indent = {
				disable = { "python", "ocaml" },
			},
		},
	},
}
