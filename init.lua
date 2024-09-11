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

local function set_highlights()
  -- Set the Visual mode highlight color
  vim.api.nvim_set_hl(0, "Visual", { bg = "#4c4f69" }) -- Replace #3a3a3a with your desired color
end

-- Call the function to set custom highlights
set_highlights()
require "options"
require "nvchad.autocmds"

-- Set up the autocmd for yank highlighting
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 300 }
  end,
})

vim.schedule(function()
  require "mappings"
end)

-- set rtp^="/home/twinfantasyfan/.opam/ocaml-book/share/ocp-indent/vim"
