-- disable unused vim builtins -- decreases startup time
local disabled_built_ins = {
	"2html_plugin",
	"getscript",
	"getscriptPlugin",
	"logipat",
	"matchit",
	"matchparen",
	"rrhelper",
	"tar",
	"tarPlugin",
	"vimball",
	"vimballPlugin",
	"zip",
	"zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 0
end

-- setup conf and lua modules
require "user.options" -- the lua directory is implied, as well as the .lua file extension
require "user.keymaps"
require "user.plugins"
require "user.colorscheme"
require "user.completion"
require "user.lsp" -- .lsp is a dir, so lua will search for an init.lua file in that dir
require "user.treesitter"
require "user.nvim_tree"
require "user.telescope"
require "user.autopairs"
