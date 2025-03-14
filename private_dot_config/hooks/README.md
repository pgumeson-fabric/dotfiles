# Customization Hooks:hook:

For any large customizations you can simply modify your local dotfiles repo at `~/.local/share/chezmoi` (and then ideally submit bug-fix PRs and improvement PRs back upstream). But if you only require small local changes (like adding zsh `aliases` or tweaking your prompt), we provide the customization hooks below.

These hooks are just local files in your home directory that live outside the chezmoi repo, but still get run at specific times when you open a new terminal.

* [.zlogin](#zlogin)
* [starship.toml](#starshiptoml)
* [.config/kitty/kitty.d](#configkittykittyd)
* [.ssh/config.d](#sshconfigd)

### .zlogin

Instead of putting shell customizations in `~/.zshrc` (which is managed by chezmoi), favor adding them in `~/.zlogin`. By default, zsh will source `.zlogin` right after `~/.zshrc`, making it the perfect place to add any aliases or zsh customizations that are specific only to you. For example:

```shell
touch ~/.zlogin
code ~/.zlogin
```

### starship.toml

To customize your [starship prompt](https://starship.rs):rocket:, you can override the default config by copying `starship.toml` to the `~/.config/hooks` dir and modifying it.

```shell
cp ~/.config/starship.toml ~/.config/hooks/starship.toml
code ~/.config/hooks/starship.toml
```

### .config/kitty/kitty.d

To customize your [kitty terminal](https://sw.kovidgoyal.net/kitty):cat:, you can add additional `.conf` files to the `~.config/kitty/kitty.d` directory. These files will be included after the main `kitty.conf`, allowing you to override any [kitty config](https://sw.kovidgoyal.net/kitty/conf/#) you want.

```shell
touch ~/.config/kitty/kitty.d/overrides.conf
code ~/.config/kitty/kitty.d/overrides.conf
```

### .ssh/config.d

To add additional SSH configs, simply add additional config files to the `~/.ssh/config.d` directory. These files will be included in your final ssh config.

```shell
touch ~/.ssh/config.d/config.local
code ~/.ssh/config.d/config.local
```
