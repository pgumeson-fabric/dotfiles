{{ template "colors.sh" }}

function _print_bot() {
  echo -e "${FG_CYAN}ˁ(OᴥO)ˀ${RESET} $1"
}

function _print_info() {
  echo -e "${FG_BLUE}[info]${RESET} $1"
}

function _print_debug() {
  echo -e "${FG_MAGENTA}[debug]${RESET} $1"
}

function _print_checking() {
  echo -e "${FG_WHITE}[checking]${RESET} $1"
}

function _print_installing() {
  echo -e "${FG_BLUE}[installing]${RESET} $1..."
}

function _print_updating() {
  echo -e "${FG_BLUE}[updating]${RESET} $1..."
}

function _print_running() {
  echo -e "${FG_BLUE}[running]${RESET} $1"
}

function _print_file() {
  echo -e "${FG_BLUE}\uf4a5 $1${RESET}"
}

function _print_notice() {
  echo -e "${FG_YELLOW}[!]${RESET} $1"
}

function _print_danger() {
  echo -e "${FG_RED}[!]${RESET} $1"
}

function _print_exists() {
  echo -e "${FG_GREEN}[exists]${RESET} $1"
}

function _print_cmd() {
  echo -e "${FG_MAGENTA}[cmd]${RESET} $1"
}

function _print_option() {
  echo -e "  ${FG_YELLOW}[${RESET}$1${FG_YELLOW}]${RESET} $2"
}

function _print_item() {
  echo -e "  ${FG_GREEN}[*]${RESET} $1"
}

function _print_ask() {
  local default="${2:-}"
  if [ -n "$default" ]; then
    echo -e "${FG_CYAN}[?]${RESET} $1 [$default] "
  else
    echo -e "${FG_CYAN}[?]${RESET} $1 "
  fi
}

function _print_dryrun() {
  echo -en "${FG_WHITE}[dry-run]${RESET}"
}

function _print_ok() {
  echo -e "${FG_GREEN}[ok]${RESET} ${1:-}"
  echo
}

function _print_warn() {
  echo -e "${FG_YELLOW}[warning]${RESET} $1"
  echo
}

function _print_error() {
  echo -e "${FG_RED}[error]${RESET} $1"
  echo
}

function _print_backup() {
  echo -e "${FG_GREEN}[backup]${RESET} $1 ${FG_WHITE}=>${RESET} $1.backup"
}

function _print_symlinking() {
  echo -e "${FG_BLUE}[symlink]${RESET} $1 ${FG_WHITE}=>${RESET} $2"
}

function _print_adding() {
  echo -e "${FG_GREEN}[adding]${RESET} $1"
}

function _print_removing() {
  echo -e "${FG_RED}[removing]${RESET} $1"
}

function _print_skipping() {
  echo -e "${FG_YELLOW}[skipping]${RESET} ${1:-}"
}

function _print_prog() {
  echo -e "${FG_MAGENTA}[$1]${RESET} $2"
}

function _print_running_script() {
  echo
  echo -e "${FG_YELLOW}[running script]${RESET} $1"
  echo
}
