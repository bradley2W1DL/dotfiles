#!/opt/homebrew/bin/fish

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
#  -> breeze (scm-breeze-ish)
# xcode-select

if ! type -q brew
  echo "homebrew needs to be installed...🍺"
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
end

if ! type -q nvim
  brew install neovim

  # intall all configured nvim packages (./config/nvim/usr)
  nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
end

if ! type -q asdf
  echo "installing asdf (version manager)"
  if test -d ~/.asdf
    # remove existing asdf config files
    rm -rf ~/.asdf
  end

  git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.0
  if ! test -d $TARGET_DIR/.config/fish/completions
    mkdir -p ~/.config/fish/completions
  end
  # manually setup completions with symlinks
  ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
end

if type -q asdf
  # install ruby, node, and yarn 
  echo "  ...asdf install ruby"
  asdf install ruby
  echo "  ...asdf install nodejs"
  asdf install nodejs
  echo "  ...asdf install yarn"
  asdf install yarn
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
