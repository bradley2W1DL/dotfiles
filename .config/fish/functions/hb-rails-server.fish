#
# function to set Okta rekated ENV variables before stating up local server
#
function hb-rails-server
  argparse 'okta_admin' 'no-admin' -- $argv
  
  set -x WEB_CONCURRENCY 1
  set -x LOAD_ACTIVE_ADMIN  1

  if set -ql _flag_no-admin
    set --erase LOAD_ACTIVE_ADMIN
  end

  if set -ql _flag_okta_admin
    # this will prompt for 1Password authentication (fingerprint etc.)
    set client_id (op read "op://Engineering/HomebaseAdmin - Local Dev/Client ID")
    set secret (op read "op://Engineering/HomebaseAdmin - Local Dev/Secret")

    if test -n "$client_id" -a -n "$secret"
      echo "setting okta ENV variables"
      set -x REQUIRE_LOCAL_OKTA_LOGIN 1
      set -x OKTA_OAUTH2_CLIENT_ID $client_id
      set -x OKTA_OAUTH2_CLIENT_SECRET $secret
    else
      echo "⚠️Unable to set HomebaseAdmin Okta ENV variables from 1Password"
    end
  end

  bundle exec rails server -b 0.0.0.0
end
