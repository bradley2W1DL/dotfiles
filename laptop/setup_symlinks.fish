#!/opt/homebrew/bin/fish

set TARGET_DIR $HOME
set BACKUP_DIR $TARGET_DIR/.dotfiles_backup
echo $BACKUP_DIR
# add any top-level files here:
set BASIC_DOTFILES .gitconfig .gitignore

if test ! -d $BACKUP_DIR
  echo "📁 creatings .dotfiles_backup directory"
  mkdir $BACKUP_DIR
end

# copy simple home-level dotfiles
for file in $BASIC_DOTFILES
  if test -e $TARGET_DIR/$file && test ! -L $TARGET_DIR/$file
    echo "$file exists, backing up now..."
    command cp $TARGET_DIR/$file $BACKUP_DIR/$file
  end

  echo "⚡️ creating symlink to $file"
  ln -sf (pwd)/$file $TARGET_DIR/$file
end

if test ! -d $TARGET_DIR/.config
  echo "📁 creating .config dir"
  mkdir $TARGET_DIR/.config
end

# symlink specific files in .config/ dir
for filepath in (pwd)/.config/*
  set file (basename $filepath)
  set CONFIG_DIR $TARGET_DIR/.config

  # file exists in ~/.config and is not already a symlink
  if test -d $CONFIG_DIR/$file && test ! -L $CONFIG_DIR/$file
    echo "$file exists, backing up now..."
    # if this succeeds...delete the dir...prevents the weird nested thing
    cp -R $CONFIG_DIR/$file $BACKUP_DIR/
    if test $status -eq 0
      echo "...and removing existing"
      rm -rf $CONFIG_DIR/$file
    end
  end
  
  if test -L $CONFIG_DIR/$file
    echo "💣 removing existing symlink to $file"
    # default to relying on dotfile symlinks...
    rm $CONFIG_DIR/$file
  end

  echo "⚡️ creating symlink to .config/$file"
  ln -sF (pwd)/.config/$file $CONFIG_DIR/$file
end

