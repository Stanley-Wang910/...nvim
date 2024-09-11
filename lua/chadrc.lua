-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}
M.lsp = { signature = false }
M.base46 = {
  theme = "catppuccin",

  hl_override = {
    comment = { italic = true, fg = "#5b6078" },
    Comment = { italic = true, fg = "#5b6078" },
    ["@comment"] = { italic = true, fg = "#5b6078" },
    LineNr = { fg = '#5b6078' },
    CursorLineNr = { fg = '#ef9f76', bold = true },
  },
  transparency = true,
}

M.ui = {
  statusline = {
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cursor", "cwd" },
    theme = "vscode_colored",
    separator_style = "default",
    overriden_modules = nil,
  },
  -- tabufline = {
  --   enabled = false,
  -- },
}

-- M.plugins = 'custom.plugins'

return M
