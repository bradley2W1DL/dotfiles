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

  -- Automatically set up your configuration after cloning packer.nvim
  --   keep this bit after all other plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

