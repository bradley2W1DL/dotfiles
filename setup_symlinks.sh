#!/bin/bash

#####################
#
# This script copies all tracked dotfiles into target directory and creates symlinks
#
##############################

## Variables
target_dir=$HOME

# backup directory of existing dotfiles on local machine
backup_dir=$HOME/.dotfiles_backup

skip_files=("README.md") # TODO get the loop to ignore files in this array

# list of files to be symlinked into target directory:
# -- this will be all files tracked by dotfiles repo
tracked_files=`git ls-tree --full-tree -r --name-only HEAD`
files=(`echo $tracked_files`)

# # # #
echo "Creating backup directory for existing dotfiles at $backup_dir"
mkdir -p $backup_dir
echo "👍"

for file in "${files[@]}"; do
  # parse the directory name out of tracked file
  dir_name=`echo $file | sed -e 's_/[^/]*$__'`

  # ensure nested directory structure exists in home and backup directories
  # (if file at source dir level, no need to create directory)
  if [ $dir_name != $file ]; then
    mkdir -p "$backup_dir/$dir_name"
    mkdir -p "$HOME/$dir_name"
  fi

  if [[ -f $target_dir/$file && ! -L $target_dir/$file ]]; then
    echo "🤖 $file exists and isn't a symlink. Backin'.it.up."
    mv $target_dir/$file $backup_dir/
  fi

  if [ -L $target_dir/$file ]; then
    echo "symlink exists, removing $file 💣"
    rm $target_dir/$file
  fi

  echo "create symlink to git-tracked file 🔥"
  ln -s "$(pwd)/$file" $target_dir/$file
done
