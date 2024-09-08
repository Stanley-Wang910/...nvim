require "custom"
require "configs.lazy"

vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

vim.wo.relativenumber = true

vim.opt.autochdir = true
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

-- Set up the autocmd for yank highlighting
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 300 }
  end,
})

-- Function to remove carriage returns and trailing whitespace
-- local function remove_cr_and_trim()
--   local view = vim.fn.winsaveview()
--   vim.cmd [[
--     silent! %s/\r$//ge
--     silent! %s/\s\+$//ge
--   ]]
--   vim.fn.winrestview(view)
-- end

-- -- Set up autocommand to remove CR and trim whitespace on paste
-- vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
--   callback = function()
--     -- Check if the last operation was a paste
--     if vim.fn.getregtype('"') ~= '' then
--       remove_cr_and_trim()
--     end
--   end,
-- })
--

-- vim.api.nvim_create_autocmd({ "TextChanged", "TextChangedI" }, {
--   callback = function()
--     -- Check if the last operation was a paste
--     if vim.fn.getregtype '"' ~= "" then
--       remove_cr_and_trim()
--     end
--   end,
-- })
-- Set up autocommand to remove CR and trim whitespace on paste, but not during normal editing
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   callback = function()
--     -- Check if the last operation was a paste
--     if vim.fn.getregtype('"') ~= '' and vim.fn.line("'[") == vim.fn.line("']") then
--       remove_cr_and_trim()
--     end
--   end,
-- })
--
-- -- Keymapping to manually trigger CR removal and whitespace trimming
-- vim.keymap.set("n", ",m", remove_cr_and_trim, { noremap = true, silent = true })

vim.schedule(function()
  require "mappings"
end)

-- set rtp^="/home/twinfantasyfan/.opam/ocaml-book/share/ocp-indent/vim"
