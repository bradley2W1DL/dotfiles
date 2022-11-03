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

local icons_status_ok, nvim_web_devicons = pcall(require, 'nvim-web-devicons')
if not icons_status_ok then
  return
end


-- I found the default ruby color too dark, esp with dark color scheme
--  * using override in setup function didn't work for me
nvim_web_devicons.set_icon{
  rb = {
    icon = "",
    color = "#e06e6e",
    name = "Rb",
  },
  rake = {
    icon = "",
    color = "#e06e6e",
    name = "Rake",
  },
  rakefile = {
    icon = "",
    color = "#e06e6e",
    name = "Rakefile",
  },
  Brewfile = {
    icon = "",
    color = "#e06e6e",
    name = "Brewfile",
  },
  ["config.ru"] = {
    icon = "",
    color = "#e06e6e",
    name = "ConfigRu",
  },
  ["Gemfile$"] = {
    icon = "",
    color = "#e06e6e",
    name = "Gemfile",
  },
  erb = {
    icon = "",
    color = "#e06e6e",
    name = "Erb",
  },
  gemspec = {
    icon = "",
    color = "#e06e6e",
    name = "Gemspec",
  },
}
