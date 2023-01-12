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

## asdf version manager (replaces rbenv, nvm, etc.)
source ~/.asdf/asdf.fish

## ALIASES ##
alias vim=nvim

## missing breeze commands
abbr -a gcb 'git checkout -b'

function heroku-console
  heroku run -a $argv[1] -e CONSOLE_USER=$CONSOLE_USER "bundle exec rails console -- --nomultiline"
end

function set-upstream
  git branch --set-upstream-to=origin/(git branch --show-current) (git branch --show-current)
end

set -x CONSOLE_USER bradley@himaxwell.com
set -x EDITOR nvim

