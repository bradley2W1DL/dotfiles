local status_ok, staline = pcall(require, 'staline')
if not status_ok then
  return
end

-- Assign this table as mode_colors
require('staline').setup{
}
staline.setup {
  defaults = {
    left_separator = " ",
    right_separator = " ",
    full_path = false,
  },
  sections = {
    left = { '- ', '-mode', 'left_sep', ' ', 'branch' },
    right = { 'cool_symbol','right_sep', '-line_column' },
  },
}

