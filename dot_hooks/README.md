# Customization Hooks:hook:

For any large customizations you can simply modify your local dotfiles repo at `~/.local/share/chezmoi` (and then ideally submit bug-fix PRs and improvement PRs back upstream). But if you only require small local changes (like adding zsh `aliases` or tweaking your prompt), we provide the customization hooks below.

These hooks are just local files in your home directory that live outside the chezmoi repo, and get run at specific times when your dotfiles initialize.

### zshrc.after

If you create a file at `~/.hooks/zshrc.after`, it will get sourced after the chezmoi managed `~/.zshrc` file. A perfect place to add any aliases you can't live without.

```shell
touch ~/.hooks/zshrc.after
code ~/.zshrc
```

### starship.toml

To customize your [starship prompt](https://starship.rs):rocket:, you can override the default config by copying `starship.toml` to the `~/.hooks` dir and modifying it.

```shell
cp ~/.config/starship.toml ~/.hooks/starship.toml
code ~/.hooks/starship.toml
```

### .ssh/config.d

To add additional SSH configs, simply add additional config files to the `~/.ssh/config.d` directory. These files will be included in your final ssh config.

```shell
touch ~/.ssh/config.d/config.local
code ~/.ssh/config.d/config.local
```

## Wishlist

Here are some additional hooks that could be useful:

* `.gitconfig` after hook
* `config.vim` overrides and additional `plugins` hook
* `kitty` terminal (or `iTerm`) customizations
