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
-- map("n", "<C-u>", "<C-u>zz")
-- map("n", "<C-d>", "<C-d>zz")
-- map("n", "n", "nzzzv")
-- map("n", "N", "Nzzzv")
map("n", "zl", "15zl")
map("n", "zh", "15zh")

map("n", "H", "^")
map("n", "L", "$")

-- line na-- Normal mode: start visual selection
map("n", "<M-w>", "viw") -- Start visual selection on word
map("v", "<M-w>", "w") -- Extend selection forward by word
map("i", "<M-w>", "<Esc>viw") -- Exit insert mode, then start visual selection

-- For backward movement
map("n", "<M-b>", "evb")
map("v", "<M-b>", "b")
map("i", "<M-b>", "<Esc>evb") -- Exit insert mode, then start visual selection backward

-- For end of word
map("n", "<M-e>", "viw")
map("v", "<M-e>", "e")

map("i", "<C-b>", "<C-a>")
map("i", "<C-a>", "<C-o>I")
map("i", "<C-e>", "<C-o>A")
-- Toggle search highlights
map("n", "<F3>", ":set hlsearch!<CR>", { silent = true })

-- -- Tmux navigation
-- map("n", "<C-h>", "<cmd> KittyNavigateLeft<CR>", { desc = "window left" })
-- map("n", "<C-l>", "<cmd> KittyNavigateRight<CR>", { desc = "window right" })
-- map("n", "<C-j>", "<cmd> KittyNavigateDown<CR>", { desc = "window down" })
-- map("n", "<C-k>", "<cmd> KittyNavigateUp<CR>", { desc = "window up" })

-- Set the working directory to the path of the current buffer.
map("n", "<leader>sd", function()
	vim.cmd("cd " .. vim.fn.expand "%:p:h")
end, { desc = "Set working directory to path of buffer." })
map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", ":", ";", { desc = "repeat find" })
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

-- map("n", "<C-f>", "<cmd>silent !tmux neww<CR>")

-- search
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Turn file into an executable
map("n", "<leader>e", "<cmd>!chmod +x %<CR>", { silent = true })
-- Ensure the nvim-tree API is loaded
-- local nvim_tree_api = require "nvim-tree.api"
map("t", "<C-[>", "<C-\\><C-n>", { silent = true })
map("t", "<C-q>", "<C-\\><C-n>:q<CR>", { desc = "Quit current terminal window" })
map("c", "<M-e>", "<Up>")
map("c", "<M-f>", "<Down>")
map("n", "<M-q>", "<C-o>")
map("n", "<M-d>", "<C-i>")

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent dir" })

map({ "n", "t" }, "<A-t>", function()
	require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })

-- diagnostics show in window

map("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })

-- vis mode search
map("v", "/", '"fy/\\V<C-R>f<CR>')
