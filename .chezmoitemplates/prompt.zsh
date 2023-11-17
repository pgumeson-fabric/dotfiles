function _prompt() {
  usage() { echo "USAGE: prompt [-p <prompt_text>] [-d <default_value>] [-r <match_regex>] [-e <match_print_error>] [-c <continue_key>] result_var" 1>&2; exit 1; }
  local OPTIND
  local prompt_text= default_value= match_regex= match_print_error="is not valid" continue_key=

  while getopts "h?cd:e:r:p:" opt; do
    case ${opt} in
    c)  continue_key=${OPTARG}
      continue_key=true
      ;;
    d)  default_value=${OPTARG}
      ;;
    e)  match_print_error=${OPTARG}
      ;;
    r)  match_regex=${OPTARG}
      ;;
    p)  prompt_text=${OPTARG}
      ;;
    *)
      usage
      ;;
    esac
  done
  shift $((OPTIND-1))

  local _result_var="$1"
  local _value=

  if [ $continue_key ]; then
    if [ -n "$prompt_text" ]; then
      echo -e "${FG_CYAN}[...]${RESET} $prompt_text (press any key to continue)"
    else
      echo -e "${FG_CYAN}[...]${RESET} (press any key to continue)"
    fi
    read -k1 -s
    return 0
  fi

  while :
  do
    if [ -n "$prompt_text" ]; then
      vared -p "$(echo -e "${FG_CYAN}[?]${RESET} "$prompt_text" ")" -c _value
    else
      vared -p "$(echo -e "${FG_CYAN}[?]${RESET} ")" -c _value
    fi
    _value="${_value:-$default_value}"

    if [ -z "$_value" ]; then
      _print_error "Cannot be blank"
      continue
    fi

    if [ -n "$match_regex" ]; then
      if ! [[ "$_value" =~ $match_regex ]]; then
        _print_error "[$_value] $match_print_error"
        continue
      fi
    fi

    if [ -n "$_result_var" ]; then
      eval $_result_var="'$_value'"
    fi
    return 0
  done
}
