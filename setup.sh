#!/bin/bash

############################
#
# ideally this would be a full setup script
#
################################

# Step 1: ensure homebrew is installed
if type brew >/dev/null 2>&1
then 
  echo 'homebrew already installed 🍺'
else
  echo 'homebrew needs to be installed...🍻'
  export NONINTERACTIVE=1
  curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh
fi

# Step 2: install fish and symlink ./config/fish into ~/.config
if type brew >/dev/null 2>&1
then
  echo 'fish shell already installed 🎣'
else
  echo '🐡 installing fish...'
  brew install fish
fi
#  1a ensure fish is default shell and can execute commands
# Add the shell to /etc/shells with:
echo /usr/local/bin/fish | sudo tee -a /etc/shells
# make fish the default login shell
chsh -s /usr/local/bin/fish

# open fish shell for rest of this setup script
fish
# Now your shell is fish...continue with setup

# Step 3: Setup backup directory and symlink files and config dirs
source './setup_symlinks.fish'

# Step 4+: Install things
source './install.fish'
