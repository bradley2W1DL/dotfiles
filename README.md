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
- Copy basic OS settings.
  - scroll direction and click settings
  - Dock settings
  - Launch applications

#### Note on install

This project uses a submodule for the nvim config.  It's a fork of the LazyVim starter repo that has been modified to my liking.

Because of this you should clone the project with the `--recurse-submodules` flag (`git clone --recurse-submodules <URL>`)

Alternatively, after cloning this repo you'll need to run two commands to initialize this submodule:
`git submodule init` to initialize the local config file
`git submodule update` to fetch all the data from the submodule project into the dot-config/nvim project directory.

For more info on git submodules checkout the [docs](https://git-scm.com/book/en/v2/Git-Tools-Submodules)
