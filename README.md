### Dotfiles
___

#### Setup Script
```bash
$ ./laptop/setup.sh
```

This script will
- symlink dotfiles from this git repo in to $HOME dir
- install the CLI programs listed below

#### CLI based programs

- homebrew
- neovim
  - ripgrep (dependency for live_grep to work) _todo_
- git
- asdf (package manager)
  - ruby
  - node
  - yarn
- fish (shell alternative)
  - fisher (fish plugins)
  - breeze (git aliases)
  - oh-my-fish (themes, etc)

#### Programs (not part of setup script)
- iTerm
- obsidian
- spotify
- chrome
- brave

##### TODO
- move iterm config out of symlinks
  - let iterm itself manage that locally -- may just want to copy in profiles
- get asdf package installs working
  - I think just need to create a .tool-versions file (not symlinked)
