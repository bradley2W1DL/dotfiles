### Dotfiles
___

_todo_:
- work on automated script to install base programs from a single command

#### Programs
- iTerm
- atom
- rubymine
- typora
- spotify
- chrome
- brave

#### CLI based programs
- homebrew
- vim
- git
- rbenv
  - ruby
- nvm
  - node
- python (?)
- oh-my-zsh

`cp ./dotfiles/* ~/`


#### WIP install scripts

**rbenv**
`brew install rbenv`

**nvm**
`curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash`

**oh my zsh**
`sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`

_note on this install, the .oh-my-zsh dotfiles is itself a git repository so didn't immediately want to be checked into the
dotfiles git repo.  Need to look into adding it as a submodule, and make sure that doesn't break the auto-update functionality_

**scm_breeze**
```
git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh
source "${ZDOTDIR:-$HOME}/.zshrc" # or source ~/.bashrc
```

**xcode command line tools**
`xcode-select –install`

