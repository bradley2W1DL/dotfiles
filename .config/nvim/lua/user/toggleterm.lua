local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup {
  open_mapping = [[<c-\>]],
  persist_mode = false, -- previous terminal mode will be remembered
  close_on_exit = true, -- close terminal window when process exits
  hide_numbers = true,
  direction = 'float',
  float_opts = {
    border = 'curved'
  }
}
