local fn = vim.fn

-- Automatically install packer (package manager)

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

print(vim.inspect(install_path))

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  print "packer require failed"
  return
end

-- Have packer use a popup window rather than a split
--   would be curious to dig into this packer display config...
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- PLUGINS --
  use "wbthomason/packer.nvim" -- have packer manage itself
  use "nvim-lua/popup.nvim" -- implementation of the Popup API from vim in neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by other plugins
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep' }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use 'famiu/bufdelete.nvim' -- extended buffer delete functionality

  -- Colorschemes --
  -- use "Rigellute/shades-of-purple.vim"
  use 'sainnhe/everforest'
  -- use { "catppuccin/nvim", as = "catppuccin" }

  -- Startup Dashboard -- Alpha --
  use{
    "goolord/alpha-nvim",
    config = function ()
      require('user.alpha') -- path to local dashboard config 
    end,
    cmd = { "Alpha", "AlphaRedraw" },
    event="BufWinEnter"
  }

  -- autocompletion plugins --
  use "hrsh7th/nvim-cmp" -- top-level completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions
  -- autopairs
  use "windwp/nvim-autopairs" -- auto-close (),[],{},'',""

  -- snippets --
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- whole buncha snippets

  -- LSP (language server protocol) -- ? not sure about "protocol"
  use "neovim/nvim-lspconfig"
  use "williamboman/mason.nvim"
  use "williamboman/mason-lspconfig.nvim"

  -- Treesitter (syntax highlighting)
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- Bufferline / Statusline --
  use { "akinsho/bufferline.nvim", tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use 'tamton-aquib/staline.nvim' -- statusline
  -- use 'feline-nvim/feline.nvim'

  -- File tree viewer
  use {
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- Fetch file type icons
    }
  }

  -- Git Blame
  use "f-person/git-blame.nvim"

  -- Yaml syntax folding
  use "pedrohdz/vim-yaml-folds"

  -- ToggleTerm (persistent terminals) --
  use {
    "akinsho/toggleterm.nvim",
    config = "require('user.toggleterm')",
    event="BufWinEnter"
  }


  -- Automatically set up your configuration after cloning packer.nvim
  --   keep this bit after all other plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

