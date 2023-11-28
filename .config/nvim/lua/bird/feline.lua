-- Feline is a statusline compatible with catppuccin theme
local status_ok, feline = pcall(require, 'feline')
if not status_ok then
  return
end

feline.setup()
