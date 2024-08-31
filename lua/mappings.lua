require "nvchad.mappings"

local map = vim.keymap.set

-- Hide LSP documentation about func args
map("i", "<M-r>", function()
  local nldocs = require "noice.lsp.docs"
  local message = nldocs.get "signature"
  nldocs.hide(message)
end)

-- Paste explicity from yank register
map({ "n", "x" }, "<leader>p", [["0p]], { desc = "paste from yank register" })
-- Center::view when moving up and down pages
map("n", "<C-u>", "<C-u>zz")
map("n", "<C-d>", "<C-d>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "zl", "15zl")
map("n", "zh", "15zh")

-- Toggle search highlights
map("n", "<F3>", ":set hlsearch!<CR>", { silent = true })

-- Tmux navigation
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "window up" })

-- Set the working directory to the path of the current buffer.
map("n", "<leader>sd", function()
  vim.cmd("cd " .. vim.fn.expand "%:p:h")
end, { desc = "Set working directory to path of buffer." })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kj", "<ESC>")

-- UndotreeToggle
map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Fugitive git status
map("n", "<leader><S-g>", vim.cmd.Git)

map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Delete in front of cursor in insert mode
map("i", "<M-d>", "<space><Esc>ce", { noremap = true })
-- move highlighted line(s)
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "<C-f>", "<cmd>silent !tmux neww<CR>")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Turn file into an executable
map("n", "<leader>e", "<cmd>!chmod +x %<CR>", { silent = true })
-- Ensure the nvim-tree API is loaded
local nvim_tree_api = require "nvim-tree.api"
