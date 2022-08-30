local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
--  the default vim <leader> key is backslash "\"
--  this remaps that to be space character
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--  normal_mode = "n",
--  insert_mode = "i"
--  visual_mode = "v"
--  visual_block_mode = "x"
--  term_mode = "t"
--  command_mode = "c"

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- shortcut to open up Netrw (file explorer) with a set 30 col size
-- keymap("n", "<leader>e", ":Lex 20<cr>", opts) -- <cr> is carriage-return (enter key)
-- open up Nvim-Tree (file explorer)
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
keymap("n", "<leader>.e", ":NvimTreeFindFile<CR>", opts)

-- quickly clear search highlighting
keymap("n", "<leader>n", ":noh<cr>", opts)

-- Resize windows with arrows
keymap("n", "<C-Up>", ":resize +2<cr>", opts)
keymap("n", "<C-Down>", ":resize -2<cr>", opts)
-- control left / right doesn't work with OSX window change behavior
-- keymap("n", "<C-Left>", ":vertical resize -2<cr>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<cr>", opts)
keymap("n", "<C-_>", ":vertical resize -2<cr>", opts)
keymap("n", "<C-=>", ":vertical resize +2<cr>", opts)

-- Navigate buffers
--  move forward and backwards between buffers with "shift-l" and "shift-h"
--  This might be a little hard to grok for me initially, rather than toggling with <C-^>
keymap("n", "<S-l>", ":bnext<cr>", opts)
keymap("n", "<S-h>", ":bprevious<cr>", opts)

-- Telescope keymaps (why you so sloooow??)
-- keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
-- keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
-- keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
-- keymap("n", "<leader>fs", ":Telescope spell_suggest<CR>", opts)
-- keymap("n", "<leader>fkm", ":Telescope keymaps<CR>", opts)

-- FZF (fuzzy finder keymaps
keymap("n", "<leader>ff", ":Files<CR>", opts)

-- Insert --
-- enable "fast-exit" of insert mode with "jk" combo 
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move selected text up and down
keymap("v", "<A-k>", ":m .-2<cr>==", opts) -- TODO these move command not working with osx
keymap("v", "∆", ":m .+1<CR>==", opts)
-- retains yanked line in register when pasting over selected text
keymap("v", "p", '"_dP', opts)


-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts) -- todo, "alt" key remapping not really working
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts) -- todo, "alt" key remapping not really working

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

