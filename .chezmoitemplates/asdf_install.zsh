plugins="$(asdf plugin list)"
while IFS= read -r line; do
  [[ $line =~ ^[[:blank:]]*(#.*)?$ ]] && continue

  read -rA parts <<<"$line"
  local plugin=$parts[1]
  local version=$parts[2]
  if [[ $plugin && $version ]]; then
    echo
    if ! grep -q $plugin <<< "$plugins" ; then
      _print_lib asdf "adding $plugin plugin"
      asdf plugin-add $plugin
      [ $? -ne 0 ] && continue
    else
      _print_lib asdf "using $plugin plugin"
    fi

    local pkgx_dev_enabled=false
    local disabled_pkgx_dev=false
    if type _pkgx_dev_off > /dev/null 2>&1; then
      pkgx_dev_enabled=true
    fi

    asdf list $plugin $version &> /dev/null
    if [ $? -ne 0 ]; then
      local versions="$(asdf list all $plugin)"
      if [[ "$version" = "system" ]]; then
        _print_lib asdf "Falling back on system $plugin"
      elif grep -q $version <<< "$versions" ; then
        # Turn pkgx dev off before installs
        if [[ "$pkgx_dev_enabled" = "true" && "$disabled_pkgx_dev" = "false" ]]; then
          _pkgx_dev_off --shy
          disabled_pkgx_dev=true
          pkgx_dev_enabled=false
        fi

        if [[ "{{ .dir }}" = "$HOME" ]]; then
          _print_lib asdf "installing $plugin $version"
          asdf install $plugin $version
          _print_ok
        else
          _print_lib asdf "This project requires $plugin $version"
          _prompt -p "Install? [Y|n] " -d "Y" response
          if [[ $response =~ ^(y|yes|Y) ]]; then
            echo
            _print_lib asdf "installing $plugin $version"
            asdf install $plugin $version

            echo
            if [ $? -eq 0 ]; then
              _print_ok "Success!"
            else
              _print_error "Something went wrong"
            fi
          else
            echo
            _print_skipping
          fi
        fi
      else
        _print_warn "No compatible version found for $plugin $version"
      fi
    else
      _print_lib asdf "$plugin $version already installed"
    fi

    # Install any bundler version in Gemfile.lock
    if [[ "$plugin" = "ruby" && -f "$PWD/Gemfile.lock" ]]; then
      symver="$(grep -A 1 "BUNDLED WITH" $PWD/Gemfile.lock | tail -n 1 | awk '{$1=$1};1')"
      if [[ -n "$symver" && $(asdf exec gem info -i -v ${symver} bundler) = 'false' ]]; then
        echo
        _print_installing "bundler v$symver from Gemfile.lock"
        result=$(asdf exec gem install bundler -v ${symver})
        _print_ok "$result"
      fi
    fi

    # Turn pkgx dev back on
    if [[ "$disabled_pkgx_dev" = "true" ]]; then
      [[ "$(command -v dev)" = "dev" ]] && dev
    fi

    # Remove pkgx ruby and rubygems from PATH
    if [[ "$plugin" = "ruby" && "$version" != "system" ]]; then
      if [[ "$(command -v env)" = "env" ]]; then
        env -ruby-lang.org -rubygems.org
      fi
    fi

    # Remove pkgx node and npm from PATH
    if [[ "$plugin" = "nodejs" && "$version" != "system" ]]; then
      # Remove pkgx node and npm from PATH
      if [[ "$(command -v env)" = "env" ]]; then
        env -nodejs.org -npmjs.com
      fi
    fi
  fi
done < "{{ .dir }}/.tool-versions"
