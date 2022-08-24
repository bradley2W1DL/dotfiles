#!/bin/bash

### TBH I haven't run this yet...b/c it's a little scary... I think it'll work tho...

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

  # ensure nested directory structure exists in backup directory
  # (if file at source dir level, no need to create directory)
  [ $dir_name != $file ] && mkdir -p "$backup_dir/$dir_name"

  if [ -f $target_dir/$file ]; then
    echo "🤖 $file exists, backin'.it.up."
    mv $target_dir/$file $backup_dir/
  fi

  # TODO should ensure that symlink doesn't already exist, and destroy it if it does??
  echo "create symlink to git-tracked file 🔥"
  ln -s "$(pwd)/$file" $target_dir/$file
done
