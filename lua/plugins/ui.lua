return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        -- signature = {
        --   enabled = false
        -- },
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup {
        cmdline = {
          view = "cmdline",
        },
        popupmenu = {
          enabled = true, -- enables the Noice popupmenu UI
          ---@type 'nui'|'cmp'
          backend = "nui", -- backend to use to show regular cmdline completions
          ---@type NoicePopupmenuItemKind|false
          -- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
          kind_icons = {}, -- set to `false` to disable icons
        },
      }
    end,
  },
}
