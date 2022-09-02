-- :help options
local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- makes `` visible in markdown files
  fileencoding = "utf-8",                  -- default file encoding
  hlsearch = true,                         -- highlight all matches on previous search patterns
  -- ignorecase = true,                    -- ignore case in search patterns
  mouse = "a",                             -- allows mouse to be used in neovim
  pumheight = 10,                          -- pop-up menu height
  showmode = true,                         -- toggles this display of mode, e.g. -- INSERT --
  showtabline = 2,                         -- always show tabs (I might not want this)
  smartcase = true,                        -- smart case (I don't know what this is)
  smartindent = true,                      -- make indenting smart again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile (swp)
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  timeoutlen = 1000,                       -- time to wait for a mapped sequence to complete
  undofile = true,                         -- enable persistent undo
  updatetime = 500,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = false,                      -- don't highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines (I may want this)
  numberwidth = 2,                         -- set number column width to 2 (defaults to 4)
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- Don't know what this does
  sidescrolloff = 8,                       -- ditto
  colorcolumn = "120",                     -- show a column line at 120 chars (max line length)
  -- guifont = "monospace:h17",               -- font used in graphical neovim applications
  foldlevelstart = 99                      -- when file is opened don't have any folding (e.g. yml files)
}

vim.opt.shortmess:append "c"

-- a basic loop over key/value pairs in the local options variable
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- options for git-blame plugin
vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = " <author> • <date> • <sha>"


vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work (not sure what it's trying to do)

vim.cmd [[
  augroup set_column_markers
    autocmd!
    autocmd Filetype yaml,yml set cursorcolumn
  augroup end
]]

