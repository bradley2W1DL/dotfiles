#!/opt/homebrew/bin/fish

## Scripts to ensure the following programs are installed:
# nvim
# rg
# jq
# 1Password cli (op)
# fish (already be installed at this point)
#  -> oh-my-fish (themes)
#  -> fisher (plugin management)
#  -> breeze (scm-breeze-ish)
# xcode-select

# run brew with local Brewfile
brew bundle -v

echo "✅ make sure to install 1Password desktop app and sign in."

if ! type -q nvim
  brew install neovim
end

# Fish plugins
if ! type -q omf
  echo 'installing oh-my-fish...'
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

  # install "pure" theme and ensure it's set
  omf install
end

if ! test -e (pwd)/.config/fish/functions/fisher.fish
  echo 'installing Fisher plugin manager...'
  curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
end

if ! test -e (pwd)/.config/fish/functions/breeze.fish
  echo 'installing breeze for git shortcuts...'
  fisher install shinriyo/breeze
end

if ! type -q xcode-select
  echo "installing xcode-select dev tools (this is very slow 🐢)"
  xcode-select -install
end
