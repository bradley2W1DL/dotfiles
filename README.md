# Dotfiles
___

## Setup Script

Using `yadm` (a git wrapper specifically for dotfiles) to manage these files now. ([docs](https://yadm.io/docs/overview))

1. Install yadm onto your system using the appropriate package manager:

**Arch/Omarchy**
```sh
sudo pacman -S yadm
```

**Mac OSX**
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && brew install git yadm
```

2. _ensure you have the correct RSA keys in place_
3. Then run `yadm clone git@github.com:bradley2W1DL/dotfiles.git`
  * you should be prompted to run the bootstrap command at this point

### CLI based apps

- homebrew
- git
- neovim
- fish (shell alternative)
  - fisher (fish plugins)
  - breeze (git aliases)
  - oh-my-fish (themes, etc)
- mise (package manager)
  - ruby
  - node
  - yarn
  - rust
  - bun
- zellij (terminal multiplexer)

### Applications

- Ghostty
- obsidian
- spotify
- chrome
- brave
- orbstack
- amphetamine
- rectangle

## TODO

#### Mac
- Get basic OS settings copied over.  Thinks like scroll direction, click settings, etc.
