#!/bin/bash

#####################
#
# This script copies all tracked dotfiles into target directory and creates symlinks
#
##############################

target_dir=$HOME
# backup directory of existing dotfiles on local machine
backup_dir=$HOME/.dotfiles_backup

self=$(basname $BASH_SOURCE)
skip_files=("README.md" $self)

# list of root-level files/directories to be symlinked into target directory:
# -- this will be all files tracked by dotfiles repo
tracked_files=`git ls-tree --name-only HEAD`
files=$(`echo $tracked_files`)

# # # #
echo "Creating backup directory for existing dotfiles at $backup_dir"
mkdir -p $backup_dir
echo "👍"
# # # #

# Map over files in array and backup existing files on machine,
#  Then create symlinks back into dotfiles directory
for file in "${files[@]}"; do
  # don't backup file if it's a symlink -- these will be overwritten
  if [[ ! -L $target_dir/$file && (-f $target_dir/$file || -d $target_dir/$file) ]]; then
    # this only works if dir being backed up doesn't already exist (files are fine)
    # should I just wipe the backup dirs?? (seems destructive)
    echo "📁 $file exists, backin it up → 💾"
    mv -f $target_dir/$file $backup_dir/
  fi

  echo "create symlink to git-tracked file 🔥"
  ln -sf $(pwd)/$file $target_dir/$file
done

