set myLoginItems to {¬
  {appName: "1Password", appPath:"/Applications/1Password.app", isHidden: true},¬
  {appName: "Amphetamine", appPath:"/Applications/Amphetamine.app", isHidden: false},¬
  {appName: "Flycut", appPath:"/Applications/Flycut.app", isHidden: false},¬
  {appName: "Rectangle", appPath:"/Applications/Rectangle.app", isHidden: false}¬
}

tell application "System Events"
  repeat with appProps in myLoginItems
    -- Check that login item doesn't already exist to avoid dupes
    if not (exists login item (appName of appProps)) then
      make new login item at end with properties {path:(appPath of appProps), name:(appName of appProps), hidden:(isHidden of appProps)}
    end if
  end repeat
end tell
