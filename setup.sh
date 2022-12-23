#!/bin/bash

############################
#
# ideally this would be a full setup script
#
################################

# Step 0: get mad permissions
export CURRENT_USER=$(whoami)
echo "whoami -> $CURRENT_USER"
sudo -v -u $CURRENT_USER

# Step 1: ensure homebrew is installed
if command -v brew &> /dev/null
then 
  echo 'homebrew already installed 🍺'
else
  echo 'homebrew needs to be installed...'
  NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  # temporarily add brew to zsh path
  echo '# set PATH, MANPATH, etc. for Homebrew.' >> ~/.zshrc
  echo export PATH=$PATH:/opt/homebrew/bin >> ~/.zshrc

  echo 'brew success! 🍻'
fi

source ~/.zshrc

echo "$(which brew)"

# Step 2: install fish and symlink ./config/fish into ~/.config
if type fish >/dev/null 2>&1
then
  echo 'fish shell already installed 🎣'
else
  echo '🐡 installing fish...'
  brew install fish
fi

# Ensure fish is default shell and can execute commands
if ! command -v fish &> /dev/null
then
  echo 'something has gone terribly wrong...check that "brew" and "fish" exist on the $PATH'
  echo '💣'
  exit 1
fi

echo 'DO I GET THIS FAR?'
# Add the shell to /etc/shells with:
echo $FISH_BIN | sudo tee -a /etc/shells
# make fish the default login shell
# TODO this doesn't seem to be working
sudo chsh -s $FISH_BIN $CURRENT_USER

# open fish shell for rest of this setup script
# TODO YOU ARE HERE...this is picking up some omf config prematurely...may need to install fish plugins before switching to fish
fish
# Now your shell is fish...continue with setup

# Step 3: Setup backup directory and symlink files and config dirs
source './setup_symlinks.fish'

# Step 4+: Install things
source './install.fish'
