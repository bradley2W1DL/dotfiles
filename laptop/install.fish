#!/opt/homebrew/bin/fish

## Scripts to ensure the following programs are installed:
# nvim
# rg
# jq
# 1Password cli (op)
# asdf
#  -> ruby
#  -> node
#  -> rust
#  -> yarn
# git
# fish (already be installed at this point)
#  -> oh-my-fish (themes)
#  -> fisher (plugin management)
#  -> breeze (scm-breeze-ish)
# xcode-select

# this command _should_ be redundant
if ! type -q brew
  echo "homebrew needs to be installed...🍺"
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
end

# run brew with local Brewfile
brew bundle -v

echo "✅ make sure to install 1Password desktop app and sign in."

if ! type -q nvim
  brew install neovim

  # intall all configured nvim packages (./config/nvim/usr)
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
end

if ! type -q asdf
  # echo "installing asdf (version manager)"
  if test -d ~/.asdf
    # remove existing asdf config files
    rm -rf ~/.asdf
  end

  # Clone specific asdf version 0.14 # current latest
  # git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
  # install this with brew instead (was there a reason not to do this?)
  brew install asdf
  if ! test -d $TARGET_DIR/.config/fish/completions
    mkdir -p ~/.config/fish/completions
  end
  # manually setup completions with symlinks
  ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end

if type -q asdf
  # install ruby, node, and yarn 
  echo "  ...add asdf plugin ruby"
  asdf plugin add ruby
  echo "  ...add asdf plugin nodejs"
  asdf plugin add nodejs
  echo "  ...asdf plugin add yarn"
  asdf plugin add yarn
  echo "  ...asdf plugin add rust"
  asdf plugin add rust
end

# Fish plugins
if ! type -q omf
  echo 'installing oh-my-fish...'
  curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish

  # install "pure" theme and ensure it's set
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
