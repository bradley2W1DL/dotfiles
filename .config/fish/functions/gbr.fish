# git browse current git dir

function gbr
  set url (git config --get remote.origin.url | sed -e 's/:/\//g' | sed -e 's/git@/https:\/\//g')

  echo $url
  open $url
end
