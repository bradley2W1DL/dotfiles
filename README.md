### Dotfiles
___

#### Setup Script

Using `yadm` (a git wrapper specifically for dotfiles) to manage these files now. ([docs](https://yadm.io/docs/overview))

Install yadm onto your system using the appropriate package manager:

**Arch/Omarchy**
`sudo pacaman -S yadm`

**Mac OSX**
`brew install yadm`

~~DEPRECATED
```bash
$ ./laptop/setup.sh
```

This script will
- symlink dotfiles from this repo into $HOME dir (using GNU Stow)
- install the CLI programs listed below
--END~~

#### CLI based programs

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

#### Programs
- Ghostty
- obsidian
- spotify
- chrome
- brave
- orbstack
- amphetamine
- rectangle

##### TODO

- Get this all working with YADM the ideal flow here would be something like

```sh
## <install> git yadm
yadm clone <this_repo_url>
yadm alt
yadm bootstrap
# not sure if the "alt" and "bootstrap" commands will happen automatically or not.
```

