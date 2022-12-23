#!/bin/bash

############################
#
# ideally this would be a full setup script
#
################################

# Step 0: get mad permissions
export CURRENT_USER=$(whoami)
echo "Let's setup $CURRENT_USER"
sudo -v -u $CURRENT_USER

# Step 1: ensure homebrew is installed
if command -v brew &> /dev/null
then 
  echo 'homebrew already installed 🍺'
else
  echo 'homebrew needs to be installed...'
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # Add brew to zsh path
  echo '# set PATH, MANPATH, etc. for Homebrew.' >> ~/.zshrc
  echo export PATH=$PATH:/opt/homebrew/bin >> ~/.zshrc

  echo 'brew success! 🍻'
fi

# makes sure `brew` is accessible in $PATH
source ~/.zshrc

# Step 2: install fish
if command -v fish &> /dev/null
then
  echo 'fish shell already installed 🎣'
else
  echo '🐡 installing fish...'
  brew install fish
fi

# Ensure fish is default shell and can execute commands
if ! command -v fish &> /dev/null
then
  echo '💣 something has gone terribly wrong...check that "brew" and "fish" exist on the $PATH'
  exit 1
fi

export FISH_BIN=$(which fish)
# Add the shell to /etc/shells with:
echo $FISH_BIN | sudo tee -a /etc/shells
# make fish the default login shell
sudo chsh -s $FISH_BIN $CURRENT_USER

# open fish shell for rest of this setup script
# TODO YOU ARE HERE...this is picking up some omf config prematurely...may need to install fish plugins before switching to fish
# if ! command -v asdf &> /dev/null; then
#   git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.11.0
#   if [ ! -d $TARGET_DIR/.config/fish/completions ]
#     mkdir -p ~/.config/fish/completions
#   end
#   # manually setup completions with symlinks
#   ln -s ~/.asdf/completions/asdf.fish ~/.config/fish/completions
# fi

# Step 3: Setup backup directory and symlink files and config dirs
fish './setup_symlinks.fish'

# Step 4+: Install things
fish './install.fish'
