# Customization Hooks:hook:

For any large customizations you can simply modify your local dotfiles repo at `~/.local/share/chezmoi` (and then ideally submit bug-fix PRs and improvement PRs back upstream). But if you only require small local changes (like adding zsh `aliases` or tweaking your prompt), we provide the customization hooks below.

These hooks are just local files in your home directory that live outside the chezmoi repo, and get run at specific times when your dotfiles initialize.

* [after.zshrc](#afterzshrc)
* [starship.toml](#starshiptoml)
* [.ssh/config.d](#sshconfigd)

### after.zshrc

If you create a file at `~/.config/hooks/after.zshrc`, it will get sourced after the chezmoi managed `~/.zshrc` file. A perfect place to add any aliases you can't live without.

```shell
touch ~/.config/hooks/after.zshrc
code ~/.zshrc
```
![after-zshrc](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/2718e084-10c5-4ced-b0c8-b92827820b35)

### starship.toml

To customize your [starship prompt](https://starship.rs):rocket:, you can override the default config by copying `starship.toml` to the `~/.config/hooks` dir and modifying it.

```shell
cp ~/.config/starship.toml ~/.config/hooks/starship.toml
code ~/.config/hooks/starship.toml
```

### .ssh/config.d

To add additional SSH configs, simply add additional config files to the `~/.ssh/config.d` directory. These files will be included in your final ssh config.

```shell
touch ~/.ssh/config.d/config.local
code ~/.ssh/config.d/config.local
```

## Wishlist

Here are some additional hooks that could be useful:

* `after.gitconfig` hook
* `config.vim` override and additional `plugins` hook
* `kitty` terminal (or `iTerm`) customizations
