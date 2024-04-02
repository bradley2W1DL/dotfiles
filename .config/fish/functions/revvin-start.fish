# single command to get revvin / Next-gen things running
#
#
function revvin-start
  argparse 'k/keep' 'h/help' -- $argv
  or return # should we just ignore unrecognized arguments?
  # cleanup existing session, unless --no-delete/-nd
  if set -ql _flag_help
    echo "revvin-start : start up NextGen dev env"
    echo "   -- start docker external dependencies"
    echo "   -- cleanup existing 'rev-dev' zellij session (unless --keep flag passed)"
    echo "   -- start fresh 'rev-dev' session"
    echo ""
    echo "usage: revvin-start [-k|--keep] [-h|--help]"
    return 0
  end

  set -f SESSION_NAME rev-dev

  if ! set -ql _flag_keep
    zellij delete-session --force $SESSION_NAME 2>/dev/null
  end

  cd $HOME/himaxwell/revvin-setup/

  # start background services (postgres, rabbitMQ, etc.)
  docker compose -f docker-compose-external.yml up -d

  # login to aws
  aws sso login --profile $SESSION_NAME

  # start up zellij with the full revvin layout
  zellij --layout revvin-dev-start --session $SESSION_NAME
end
