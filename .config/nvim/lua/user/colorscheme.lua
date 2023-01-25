-- chose installed plugin colorscheme or fallback to default

-- To re-install commented colorschemes uncomment in plugins.lua
-- "shades_of_purple"
-- "everforest"
-- "catppuccin"
local colorscheme = "catppuccin"

require("catppuccin").setup({
  flavour = "frappe", -- macchiato, mocha
  background = {
    light = "latte",
    dark = "frappe",
  },
  styles = {
    comments = {}, -- "italic" by default
    conditionals = {}, -- "italic" by default
  }
})

local defaultColor = "slate"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  vim.cmd("colorscheme " .. defaultColor)
end

