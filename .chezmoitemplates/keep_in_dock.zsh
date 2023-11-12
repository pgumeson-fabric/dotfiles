function keep_in_dock() {
  local app="$1"
  if [ -n "$app" ]; then
    local search="Applications/$(echo "$app" | sed 's/ /%20/g').app"
    local result=$(defaults read com.apple.dock persistent-apps | grep "$search") 2>&1 > /dev/null
    if [ -z "$result" ]; then
      _print_running "keep in dock -> $app"
      echo
      defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/${app}.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
      # killall Dock &> /dev/null
    fi
  else
    _print_error "App cannot be blank"
    exit -1
  fi
}

