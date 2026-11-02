if status is-interactive
  # Commands to run in interactive sessions can go here
end

## DEFAULT FISH COLOR OVERRIDES ##
set fish_color_valid_path cyan # no underline
set fish_color_command normal

## THEME COLOR OVERRIDES ##
set pure_color_primary green
set pure_color_git_branch pure_color_light
set pure_color_prompt_on_success white

set fish_greeting

## activate Mise - package manager
if status is-interactive
  mise activate fish | source # added by https://mise.run/fish
else
  mise activate fish --shims | source
end

## add homebrew to path
fish_add_path /opt/homebrew/bin

fish_add_path ~/.local/bin

## ALIASES ##
alias vim=nvim
alias n=nvim
alias lg=lazygit
abbr -a be 'bundle exec'

# go back two directories
function ...
  ../..
end

function heroku-console
  heroku run -a $argv[1] -e CONSOLE_USER=$CONSOLE_USER "bundle exec rails console -- --nomultiline"
end

function set-upstream
  git branch --set-upstream-to=origin/(git branch --show-current) (git branch --show-current)
end

# Ran into an OSX issue where Nvim would crash because of unsigned plugin packages
# This can be fixed by manually re-signing these packages:
function nvim-resign-plugins
  echo "Re-signing Neovim plugins..."
  find ~/.local/share/nvim ~/.config/nvim \( -name "*.so" -or -name "*.dylib" \) \
    -exec codesign --force --deep --sign - {} \; 2>/dev/null
  echo "✓ Done!"
end

set -x EDITOR nvim

## OSX + rails + puma 6.1+ support
set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES


# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
