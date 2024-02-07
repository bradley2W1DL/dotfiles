local status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- force neovim to recognize .astro file extension as an "Astro" file
vim.filetype.add({
  extension = {
    astro = "astro"
  }
})

treesitter_config.setup {
  -- this can also be "all"
  ensure_installed = {
    "astro", "bash", "lua", "gitignore", "javascript", "typescript", "ruby", "markdown"
  },
  sync_install = false,
  auto_install = true,

  -- List of parsers to ignore (add here for broken parsers)
  ignore_install = { "" },
  autopairs = {
    enabled = true,
  },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    -- add any parsers where indentation doesn't seem to work
    disable = { "ruby" },
  },
}

-- Hint: if syntax highlighting is broken try renaming the default neovim parser directory
