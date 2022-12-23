#!/usr/local/bin/fish

## Scripts to ensure the following programs are installed:
# nvim
# asdf
#  -> ruby
#  -> node
#  -> python (TODO)
#  -> yarn
# git
# fish (should already be installed at this point)
#  -> oh-my-fish (themes)
#  -> fisher (plugin management)
#  -> breeze (scm-ish)
# xcode-select

if ! type -q brew
  echo "homebrew needs to be installed...🍺"
  set NONINTERACTIVE 1
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
end

if ! type -q git
  echo "installing git..."
  brew install git
end

if ! type -q nvim
  brew install neovim
end

if ! type -q asdf
  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.0
  if ! test -d $TARGET_DIR/.config/fish/completions
    mkdir -p ~/.config/fish/completions
  end
  # manually setup completions with symlinks
  ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions

  # install ruby, node, and yarn 
  asdf install ruby
  asdf install nodejs
  asdf install yarn
end

# fish plugins
if ! type -q omf
  echo 'installing oh-my-fish...'
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

  # install "pure" theme
  omf install pure
  omf theme pure
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
