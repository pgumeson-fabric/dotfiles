# Zipnosis Dotfiles

Maintained with https://chezmoi.io

**TLDR:** skip to [Installation](#installation):clap:

## Why? What does it do?

Getting a new machine up and running with all the tools you use (shells, editors, version control) can be consuming and error prone. Not to mention keeping up with new versions and breaking changes... Chezmoi tracks your personal configuration files (dotfiles like `~/.zshrc`) in git, and allows you to quickly restore your settings on any new or existing machine. It also allows common project configurations to be shared and updated across teams.

Read more about chezmoi here: [What does chezmoi do?](https://www.chezmoi.io/what-does-chezmoi-do), [Quick Start Guide](https://www.chezmoi.io/quick-start), [User Guide](https://www.chezmoi.io/user-guide/command-overview).

#### This `dotfiles` repo will do the following:

1. Installs [Homebrew](https://brew.sh/) and bundles your [Brewfile](https://github.com/pgumeson-fabric/dotfiles/blob/main/Brewfile.tmpl):beer:
1. Installs [asdf](https://asdf-vm.com/) and the Ruby:small_red_triangle: plugin for managing Ruby versions used in our projects.
1. Installs and configures [pkgx](https://pkgx.sh), the new package manager from the creator of Homebrew.
1. Configures [direnv](https://direnv.net) for setting project specific PATH and ENV vars in an `.envrc` file.
1. Generates your SSH keypair and uploads your public key to your GitHub account:octocat:
1. Installs VSCode and [the best extensions](https://github.com/pgumeson-fabric/dotfiles/blob/main/Brewfile.tmpl#L57-L88).
1. Configures [starship cross-shell prompt](https://starship.rs) as your default prompt:rocket:
1. Optional [Neovim](https://neovim.io) configuration for vim users.

#### Finally, it installs the [kitty terminal](https://sw.kovidgoyal.net/kitty):cat: and configures your `zsh` shell to look and function like this:
![session](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/95e65c2e-62f5-4bf8-9e76-1be7c2bf8288)

Of course, all these settings are totally customizable. But this `dotfiles` repo serves as a great starting point.

## Prerequisites on OS X

1. OS X `command-line-tools` installed (or a full `XCode` installation)
2. `git` installed and a GitHub account.

> [!NOTE]
> Opening a terminal and running `git -v` should walk you through the
> process of installing xcode command line tools (if not already installed).
> Otherwise run `xcode-select --install`.

## Prerequisites on Linux

Some linux support [already in place](https://github.com/pgumeson-fabric/dotfiles/blob/main/.chezmoi.toml.tmpl#L72-L82), but not tested.

<br>

# Installation

### 1. First, make sure you have enabled admin privileges in Rippling
![rippling-admin](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/39430725-7741-493a-8eb8-b77957bb68a2)

### 2. Then run the following command to install `chezmoi` and boostrap your machine.

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/bin init --apply pgumeson-fabric
```

> [!NOTE]
> If something goes wrong during the installation, simply re-run the above command.

### 3. Follow the prompts
Chezmoi will prompt you for a few things, like your git email address and your preferred text editor (`VSCode`, `Neovim`, etc.). It will then walk you through all the installation steps and use those saved configs to setup everything customized for you.

### 4. That's it! :sparkles:
When you're finished, all you have to do is open a new `kitty` terminal and your new .zshrc will be loaded with your settings:cat:.

<br>

> [!IMPORTANT]
> If on chezmoi's first run, the installation detects that you have files in your home directory that would be overwritten,
> you will be prompted to back them up to your `~/.dotfilesbackups` directory. That way you can always restore specific files, or go
> all the way back to the way things were.

![backup-home](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/baf95ee9-ac4d-41fb-969e-c20e0f7acede)

<br>

> [!NOTE]
> During the initial installation you will be guided through the process of generationg your SSH keypair and uploading the public key to your GitHub account.
> **This will not overwrite or affect any existing SSH keys you currently have**. However, if you current SSH key uses an older encryption method like `rsa`
> insted of `ed25519`, then you should delete your older keys from your GitHub account.:key:

![ssh-keygen](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/2236f6bf-2584-420b-99b2-dea7779d6450)

#### Your new public key in GitHub :octocat:

![github-key](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/caa19057-7b8b-4cf4-ac87-752b59b19967)

> [!IMPORTANT]
> Of course it will use your `user` and `laptop` name for the public key title, not mine:name_badge:

<br>

# Daily Use

Once the installer has finished running, `chezmoi` will be in your PATH and you can run commands like `chezmoi update -v`, which will pull down the latest changes from git and apply them to your home directory. Chezmoi is fully idempotent, so it will only install new packages or apply updates that have changed since your last run.

If you want to make modifications to your configs then the typical workflow looks like this:

```shell
$ cd ~
$ chezmoi edit .zshrc
$ chezmoi apply  # to apply your changes to your home dir
```

Then once you are happy with your changes:
```shell
chezmoi cd  # cd into your dotfiles git directory
git add dot_zshrc.tmpl
git commit
```

> [!NOTE]
> If you only need to make small changes, then you shouldn't need to commit anything at all.
> In fact, it's fine to just use the customization hooks below. That way you can easily
> pull down upstream changes and improvements without branching or forking.

# Customizing

For any large customizations you can simply modify your local dotfiles repo at `~/.local/share/chezmoi` (and then ideally submit bug-fix PRs and improvement PRs back upstream). But if you only require small local changes (like adding zsh `aliases` or tweaking your prompt), we provide some [customization hooks](https://github.com/pgumeson-fabric/dotfiles/tree/main/private_dot_config/hooks#readme).

These hooks are just local files in your home directory that live outside the chezmoi repo, and get run at specific times when your dotfiles initialize. So for instance, if you create a file at `~/.config/hooks/after.zshrc`, it will get sourced after the chezmoi managed `~/.zshrc` file. A perfect place to add any aliases or zsh customizations you can't live without. For example:

```shell
touch ~/.config/hooks/after.zshrc
code ~/.config/hooks/after.zshrc
```

Read more in the [Hooks README.md](https://github.com/pgumeson-fabric/dotfiles/tree/main/private_dot_config/hooks#readme):hook:

# Contributing

Let me know if you are interested in submitting PRs and I'll add you as a contributor:nerd_face:

### Wishlist
- [x] Backup home directory on first run
- [x] Customization hooks :hook:
- [ ] Auto-clone our projects to local projects dir and configure
- [ ] Move fully to pkgx once it supports all the package versions we're using
- [ ] Fish shell support :fish:
- [ ] Opt-in React tools and environment
- [ ] Opt-in Flutter tools and environment :bird:
- [ ] Secure retreival of files from passowrd manager :closed_lock_with_key:
- [ ] LazyVim config :zzz:
- [ ] Opt-in for Emacs editor
