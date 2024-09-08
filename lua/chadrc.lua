-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}
M.lsp = { signature = false }
M.base46 = {
  theme = "catppuccin",

  hl_override = {
    comment = { italic = true, fg = "#8d8c8f" },
    ["@comment"] = { italic = true, fg = "#8d8c8f" },
  },
}

M.ui = {
  statusline = {
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "cwd" },
    theme = "vscode_colored",
    separator_style = "default",
    overriden_modules = nil,
  },
}

-- M.plugins = 'custom.plugins'

return M
