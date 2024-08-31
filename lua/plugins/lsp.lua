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
      ensure_installed = {
        -- Languages
        "pyright",
        "debugpy",
        -- Formatters
        "black",
        "prettier",
      },
    },
  },
}
