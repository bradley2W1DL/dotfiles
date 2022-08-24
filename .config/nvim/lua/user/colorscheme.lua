-- chose installed plugin colorscheme or fallback to default

-- "shades_of_purple"
local colorscheme = "everforest" -- "everforest" is also a good option (with light mode)

local defaultColor = "slate"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found")
  vim.cmd("colorscheme " .. defaultColor)
end

