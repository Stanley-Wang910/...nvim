return {

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      -- ensure_installed = {
      --   -- Languages
      --   "pyright",
      --   "debugpy",
      --   -- Formatters
      --   "black",
      --   "prettier",
      -- },
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    config = function()
      -- Note:
      --     the default search path for `require` is ~/.config/nvim/lua
      --     use a `.` as a path seperator
      --     the suffix `.lua` is not needed
      require "configs.null-ls"
    end,
  },
}
