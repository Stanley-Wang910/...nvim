return {
  {
    "stevearc/oil.nvim",
    -- lazy = false,
    cmd = "Oil",
    event = {
      "VimEnter */*,.*",
      "BufNew */*,.*",
    },

    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["M-h"] = "actions.select_split",

          ["<C-l>"] = false,
          -- ["<M-q>"] = "actions.parent",
        },
        view_options = {
          show_hidden = true,
        },
        -- keys = {
        --   { "-", function() require("oil").open() end, mode = {'n'}, desc = "Open parent dir" },
        -- },
      }
      -- Open parent dir in current window

      -- Open parent in floating window
      -- vim.keymap.set("n", "<space>")
    end,
  },
}
