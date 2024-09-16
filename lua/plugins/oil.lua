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
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,

        win_options = {
          signcolumn = "yes:2",
        },
        -- win_options = {
        --   signcolumn = "number",
        -- },
        columns = { "icon" },
        keymaps = {
          ["<C-h>"] = false,
          ["M-h"] = "actions.select_split",

          ["<C-l>"] = false,
          -- ["<M-q>"] = "actions.parent",
          ["<C-r>"] = "actions.refresh",
        },
        view_options = {
          show_hidden = true,
          natural_order = true,
          is_always_hidden = function(name, _)
            return name == ".." or name == ".git"
          end,
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
  {
    "SirZenith/oil-vcs-status",

    lazy = false,
    dependencies = {

      "stevearc/oil.nvim",
    },

    config = function()
      local status_const = require "oil-vcs-status.constant.status"
      local StatusType = status_const.StatusType
      local colors = {
        added = "#a6e3a1", -- Green
        modified = "#cc9d82", -- Yellow
        deleted = "#f38ba8", -- Red
        renamed = "#FFA500", -- Orange
        untracked = "#cba6f7", -- Gray
        ignored = "#404040", -- Dark Gray
        -- Add more colors as needed
      }

      -- Set up custom highlight groups
      local function set_highlights()
        vim.api.nvim_set_hl(0, "OilVcsStatusAdded", { fg = colors.added })
        vim.api.nvim_set_hl(0, "OilVcsStatusModified", { fg = colors.modified })
        vim.api.nvim_set_hl(0, "OilVcsStatusDeleted", { fg = colors.deleted })
        vim.api.nvim_set_hl(0, "OilVcsStatusRenamed", { fg = colors.renamed })
        vim.api.nvim_set_hl(0, "OilVcsStatusUntracked", { fg = colors.untracked })
        vim.api.nvim_set_hl(0, "OilVcsStatusIgnored", { fg = colors.ignored })
        vim.api.nvim_set_hl(0, "OilVcsStatusUpstreamAdded", { fg = colors.added })
        vim.api.nvim_set_hl(0, "OilVcsStatusUpstreamModified", { fg = colors.modified })
        vim.api.nvim_set_hl(0, "OilVcsStatusUpstreamDeleted", { fg = colors.deleted })
        vim.api.nvim_set_hl(0, "OilVcsStatusUpstreamRenamed", { fg = colors.renamed })
        vim.api.nvim_set_hl(0, "OilVcsStatusUpstreamUntracked", { fg = colors.untracked })
        vim.api.nvim_set_hl(0, "OilVcsStatusUpstreamIgnored", { fg = colors.ignored })

        -- Add more highlight definitions as needed
      end

      -- Call the function to set highlights
      set_highlights()

      require("oil-vcs-status").setup {
        status_hl_group = {
          [StatusType.Added] = "OilVcsStatusAdded",
          [StatusType.Copied] = "OilVcsStatusCopied",
          [StatusType.Deleted] = "OilVcsStatusDeleted",
          [StatusType.Ignored] = "OilVcsStatusIgnored",
          [StatusType.Modified] = "OilVcsStatusModified",
          [StatusType.Renamed] = "OilVcsStatusRenamed",
          [StatusType.TypeChanged] = "OilVcsStatusTypeChanged",
          [StatusType.Unmodified] = "OilVcsStatusUnmodified",
          [StatusType.Unmerged] = "OilVcsStatusUnmerged",
          [StatusType.Untracked] = "OilVcsStatusUntracked",
          [StatusType.External] = "OilVcsStatusExternal",

          [StatusType.UpstreamAdded] = "OilVcsStatusUpstreamAdded",
          [StatusType.UpstreamCopied] = "OilVcsStatusUpstreamCopied",
          [StatusType.UpstreamDeleted] = "OilVcsStatusUpstreamDeleted",
          [StatusType.UpstreamIgnored] = "OilVcsStatusUpstreamIgnored",
          [StatusType.UpstreamModified] = "OilVcsStatusUpstreamModified",
          [StatusType.UpstreamRenamed] = "OilVcsStatusUpstreamRenamed",
          [StatusType.UpstreamTypeChanged] = "OilVcsStatusUpstreamTypeChanged",
          [StatusType.UpstreamUnmodified] = "OilVcsStatusUpstreamUnmodified",
          [StatusType.UpstreamUnmerged] = "OilVcsStatusUpstreamUnmerged",
          [StatusType.UpstreamUntracked] = "OilVcsStatusUpstreamUntracked",
          [StatusType.UpstreamExternal] = "OilVcsStatusUpstreamExternal",
        },

        -- show_ignored = true, -- show files that match gitignore with !!
        status_symbol = {
          [StatusType.Added] = "",
          [StatusType.Copied] = "󰆏",
          [StatusType.Deleted] = "",
          [StatusType.Ignored] = "",
          [StatusType.Modified] = "",
          [StatusType.Renamed] = "",
          [StatusType.TypeChanged] = "󰉺",
          [StatusType.Unmodified] = " ",
          [StatusType.Unmerged] = "",
          [StatusType.Untracked] = "",
          [StatusType.External] = "",

          [StatusType.UpstreamAdded] = "󰈞",
          [StatusType.UpstreamCopied] = "󰈢",
          [StatusType.UpstreamDeleted] = "",
          [StatusType.UpstreamIgnored] = " ",
          [StatusType.UpstreamModified] = "󰏫",
          [StatusType.UpstreamRenamed] = "",
          [StatusType.UpstreamTypeChanged] = "󱧶",
          [StatusType.UpstreamUnmodified] = " ",
          [StatusType.UpstreamUnmerged] = "",
          [StatusType.UpstreamUntracked] = "",
          [StatusType.UpstreamExternal] = "",
        },
      }
    end,
  },
}
