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
    # this needs some work.  If the session isn't removed then I should just attach to exisiting
    # session and restart everything...
  end

  cd $HOME/himaxwell/revvin-setup/

  # start background services (postgres, rabbitMQ, etc.)
  docker compose -f docker-compose-external.yml up -d --remove-orphans

  set -l time_now (date +"%s")
  set -l aws_token_expires_at (
    find ~/.aws/sso/cache -type f -not -name "botocore*.json" | xargs cat | jq .expiresAt | xargs -J % date -jf "%FT%TZ" % +"%s"
  )
  # if no token file is found, default this to 0
  if ! set -q aws_token_expires_at
    set -l aws_token_expires_at 0
  end
  
  if test $time_now -ge $aws_token_expires_at
    echo "need to refresh aws token..."

    aws sso login --profile $SESSION_NAME
  end

  # start up zellij with the full revvin layout
  zellij --layout revvin-dev-start --session $SESSION_NAME
end
