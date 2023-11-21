function keep_in_dock() {
  local app="$1"
  if [ -n "$app" ]; then
    local search="Applications/$(echo "$app" | sed 's/ /%20/g').app"
    if ! defaults read com.apple.dock persistent-apps | grep -Eq "$search"; then
      _print_adding "${BOLD}${app}.app${RESET} to Dock"
      defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/${app}.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
      # killall Dock &> /dev/null
    else
      _print_skipping "${BOLD}${app}.app${RESET} already in Dock"
    fi
  else
    _print_error "missing argument: app"
    exit -1
  fi
}
