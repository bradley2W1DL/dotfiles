-- :help options
vim.opt.backup = false                          -- creates a backup file
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- makes `` visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- default file encoding
vim.opt.hlsearch = true                         -- highlight all matches on previous search patterns
-- vim.opt.ignorecase = true                    -- ignore case in search patterns
vim.opt.mouse = "a"                             -- allows mouse to be used in neovim
vim.opt.pumheight = 10                          -- pop-up menu height
vim.opt.showmode = true                         -- toggles this display of mode, e.g. -- INSERT --
vim.opt.showtabline = 2                         -- always show tabs (I might not want this)
vim.opt.smartcase = true                        -- smart case (I don't know what this is)
vim.opt.smartindent = true                      -- make indenting smart again
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false                        -- creates a swapfile (swp)
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete
vim.opt.undofile = true                         -- enable persistent undo
vim.opt.updatetime = 500                        -- faster completion (4000ms default)
vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = true                        -- convert tabs to spaces
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.cursorline = false                      -- highlight the current line

vim.opt.number = true                           -- set numbered lines
vim.opt.relativenumber = false                  -- set relative numbered lines (I may want this)
vim.opt.numberwidth = 3                         -- set number column width to 3 (defaults to 4)

vim.opt.signcolumn = "yes"                      -- always show the sign column, otherwise it would shift text each time
vim.opt.wrap = false                            -- display lines as one long line
vim.opt.scrolloff = 8                           -- Don't know what this does
vim.opt.sidescrolloff = 8                       -- ditto

vim.opt.guifont = "monospace:h17"               -- font used in graphical neovim applications

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work (not sure what it's trying to do)

