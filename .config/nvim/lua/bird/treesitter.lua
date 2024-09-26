local status_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- force neovim to recognize .astro file extension as an "Astro" file
vim.filetype.add({
  extension = {
    astro = "astro",
    slim = "slim",
  }
})

treesitter_config.setup {
  -- this can also be "all"
  ensure_installed = {
    "astro", "bash", "lua", "gitignore", "javascript", "typescript", "tsx", "ruby", "markdown"
  },
  sync_install = false,
  auto_install = true,

  -- List of parsers to ignore (add here for broken parsers)
  ignore_install = {},
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

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
-- Custom parser cloned from git repo
-- for this to work you must also manually copy the queries from the local repo into
-- <runtimepath>/nvim-treesitter/queries/slim/
parser_config.slim = {
  install_info = {
    url = "~/workspace/tree-sitter-slim", -- local path or git repo
    files = {"src/parser.c", "src/scanner.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    -- optional entries:
    branch = "master", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  -- filetype = "slim", -- if filetype does not match the parser name
}
