local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

nvim_tree.setup({
  respect_buf_cwd = true,
  sync_root_with_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true,
    ignore_list = {},
  },
  view = {
    adaptive_size = true, -- resize tree window to fix filename
  },
  renderer = {
    icons = {
      show = {
        git = false,
      }
    }
  }
})
