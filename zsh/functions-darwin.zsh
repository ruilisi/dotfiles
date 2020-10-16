if [[ "$(uname)" != "Darwin" ]]; then
  return
fi

function remove_helper() {
  sudo launchctl unload /Library/LaunchDaemons/com.$1.helper.plist; sudo rm /Library/PrivilegedHelperTools/com.$1.helper
}

