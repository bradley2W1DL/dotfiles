#!/usr/local/bin/fish

set TARGET_DIR $HOME
set BACKUP_DIR $TARGET_DIR/.dotfiles_backup

# add any top-level files here:
set BASIC_DOTFILES .gitconfig .gitignore

if test ! -d $TARGET_DIR/$BACKUP_DIR
  mkdir $TARGET_DIR/$BACKUP_DIR
end

for file in $BASIC_DOTFILES
  if test -e $TARGET_DIR/$file
    echo "$file exists, backing up now..."
    command cp $TARGET_DIR/$file $BACKUP_DIR/$file
  end

  echo "⚡️ creating symlink to $file"
  ln -sf (pwd)/$file $TARGET_DIR/$file
end

for file in ./.config/*
  if test -d $TARGET_DIR/$file
    echo "$file exists, backing up now..."
    cp -R $TARGET_DIR/$file $BACKUP_DIR/
  end

  echo "⚡️ creating symlink to $file"
  ln -sf (pwd)/$file $TARGET_DIR/$file
end

