require "nvchad.mappings"

local map = vim.keymap.set

-- MOVEMENT

-- basic movement enhancements
map({ "n", "v" }, "H", "^") -- move to start of line
map({ "n", "v" }, "L", "$") -- move to end of line
map({ "n", "v" }, "<M-H>", "H") -- move to top of screen
map({ "n", "v" }, "<M-L>", "L") -- move to bottom of screen

-- centered scrolling
map("n", "<C-u>", "<C-u>zz") -- half page up centered
map("n", "<C-d>", "<C-d>zz") -- half page down centered
map("n", "n", "nzzzv") -- next search result centered
map("n", "N", "Nzzzv") -- previous search result centered

-- jump navigation
map("n", "<M-q>", "<C-o>") -- jump back
map("n", "<M-d>", "<C-i>") -- jump forward

-- insert mode remaps
map("i", "<C-a>", "<C-o>I") -- start of line
map("i", "<C-e>", "<C-o>A") -- end of line

-- EDITING

-- basic editing
map("n", "<CR>", "ciw") -- change inner word
map("i", "kj", "<ESC>") -- exit insert mode
map("i", "<M-d>", "<space><Esc>ce") -- delete in front of cursor

-- visual line operations
map("v", "J", ":m '>+1<CR>gv=gv") -- move line down
map("v", "K", ":m '<-2<CR>gv=gv") -- move line up

-- normal mode: start visual selection
map("n", "<M-w>", "viw") -- start visual selection on word
map("v", "<M-w>", "w") -- extend selection forward by word
map("i", "<M-w>", "<Esc>viw") -- exit insert mode, then start visual selection
map("n", "<M-b>", "evb")
map("v", "<M-b>", "b")
map("i", "<M-b>", "<Esc>evb") -- exit insert mode, then start visual selection backward
map("n", "<M-e>", "viw")
map("v", "<M-e>", "e")

-- misc
map("i", "<C-b>", "<C-a>")

-- CLIPBOARD

map({ "n", "x" }, "<leader>p", [["0p]]) -- paste from yank register
map("n", "<leader>yc", "yy<cmd>normal gcc<CR>p") -- duplicate and comment
map("v", "<leader>yc", "ygvgc`>p") -- duplicate and comment (visual)

-- SEARCH & REPLACE

map("n", "<Esc>", "<cmd>nohlsearch<CR>") -- clear search highlights
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- search and replace
map("v", "/", '"fy/\\V<C-R>f<CR>') -- search and replace in vis

-- COMMAND MODE

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", ":", ";", { desc = "repeat find" })
map("c", "<M-e>", "<Up>") -- command history up
map("c", "<M-f>", "<Down>") -- command history down

-- TERMINAL OPERATIONS

map("t", "<C-[>", "<C-\\><C-n>") -- exit terminal mode
map("t", "<C-q>", "<C-\\><C-n>:q<CR>") -- quit terminal window
map({ "n", "t" }, "<A-t>", function() -- toggle terminal
	require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end)

-- PLUGIN SPECIFICS

-- LSP
map("i", "<M-r>", function() -- hide lsp documentation
	local nldocs = require "noice.lsp.docs"
	local message = nldocs.get "signature"
	nldocs.hide(message)
end)

-- debug
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>") -- toggle breakpoint

-- file management
map("n", "-", "<CMD>Oil<CR>") -- open parent directory
map("n", "<leader>sd", function() -- set working directory
	vim.cmd("cd " .. vim.fn.expand "%:p:h")
end)

-- git
map("n", "<leader><S-g>", vim.cmd.Git) -- fugitive git status

-- undo tree
map("n", "<leader>u", vim.cmd.UndotreeToggle)

map("n", "<leader>sd", function()
	vim.cmd("cd " .. vim.fn.expand "%:p:h")
end, { desc = "Set working directory to path of buffer." })

-- undotree toggle
map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- fugitive git status
map("n", "<leader><S-g>", vim.cmd.Git)

-- turn file into an executable
map("n", "<leader>e", "<cmd>!chmod +x %<CR>", { silent = true })
map("n", "<M-q>", "<C-o>")
map("n", "<M-d>", "<C-i>")

map("n", "-", "<CMD>Oil<CR>", { desc = "Open parent dir" })

-- diagnostics show in window
map("n", "<Leader>d", ":lua vim.diagnostic.open_float()<CR>", { noremap = true, silent = true })
