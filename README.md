# Zipnosis Dotfiles

Maintained with https://chezmoi.io

## Why? What does it do?

Getting a new machine up and running with all the tools you use (shells, editors, version control) can be consuming and error prone. Not to mention keeping up with new versions and breaking changes... Chezmoi tracks your personal configuration files (dotfiles like `~/.zshrc`) in git, and allows you to quickly restore your settings on any new or existing machine. It also allows common project configurations to be shared and updated across teams.

Read more about chezmoi here: [What does chezmoi do?](https://www.chezmoi.io/what-does-chezmoi-do), [Quick Start Guide](https://www.chezmoi.io/quick-start), [User Guide](https://www.chezmoi.io/user-guide/command-overview).

#### This `dotfiles` repo will do the following:

1. Installs [Homebrew](https://brew.sh/) and bundles your [Brewfile](https://github.com/pgumeson-fabric/dotfiles/blob/main/Brewfile.tmpl):beer:
1. Installs [asdf](https://asdf-vm.com/) and the ruby plugin for managing ruby versions used in our projects.
1. Installs and configures [pkgx](https://pkgx.sh), the new package manager from the creator of Homebrew.
1. Configures [direnv](https://direnv.net) for setting project specific PATH and ENV vars in an `.envrc` file.
1. Generates your SSH keypair and uploads your public key to your GitHub account:octocat:
1. Installs VSCode and [the best extensions](https://github.com/pgumeson-fabric/dotfiles/blob/main/Brewfile.tmpl#L57-L88).
1. Configures [starship cross-shell prompt](https://starship.rs) as your default prompt:rocket:
1. Optional [Neovim](https://neovim.io) configuration for vim users.

#### Finally, it installs the [kitty terminal](https://sw.kovidgoyal.net/kitty):cat: and configures your `zsh` shell to look like this:
![terminal](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/a9a70308-c093-4d38-9de0-19417226b327)

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
![rippling-admin](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/fe543828-1d1f-4472-96ba-96bb869ae9fb)

### 2. Then run the following command to install `chezmoi` and boostrap your machine.

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/bin init --apply pgumeson-fabric
```

If something goes wrong during the installation, you can continue by re-running the above command (or just `~/bin/chezmoi apply`)

### 3. Follow the prompts
Chezmoi will prompt you for a few things, like your git email address and your preferred text editor (`VSCode`, `Neovim`, etc.). It will then walk you through all the installation steps and use those saved configs to setup everything customized for you.

### 4. That's it! :sparkles:
When you're finished, all you have to do is open a new `kitty` terminal and your new .zhsrc will be loaded with your settings:cat:.

<br>

> [!IMPORTANT]
> If on chezmoi's first run, the installation detects that you have files in your home directory that would be overwritten,
> you will be prompted to back them up to the ~/.dotfilesbackups`. That way you can always restore specific files, or go
> all the way back to the way things were.

![backup-homedir](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/54c7cdac-4bb8-45ce-baee-d097557337a7)

<br>

> [!NOTE]
> During the initial installation you will be guided through the process of generationg your SSH keypair and uploading the public key to your GitHub account.
> **This will not overwrite or affect any existing SSH keys you currently have**. However, if you current SSH key uses an older encryption method like `rsa`
> insted of `ed25519`, then you can safely delete your older keys from your GitHub account.:key: :octocat:

<img width="834" alt="Screenshot 2023-11-12 at 11 28 27 AM" src="https://github.com/pgumeson-fabric/dotfiles/assets/145386658/30fc6ab0-998a-41b5-a128-aa9d902ddd99">

<br><br>

# Day to Day Usage

Once you're all bootstrapped using the above instructions, chezmoi will be in your PATH and you can run commands like `chezmoi update -v` to pull down latest changes and apply them to your home directory. Chezmoi is fully idempotent, so it will only install new packages or apply updates that have changed.

## Customizing

For any large customizations you can simply modify your local dotfiles repo at `~/.local/share/chezmoi` (and then ideally submit bug-fix PRs and improvement PRs back upstream). But if you only require small local changes (like adding zsh `aliases` or tweaking your prompt), we provide some [customization hooks](https://github.com/pgumeson-fabric/dotfiles/blob/main/dot_hooks/README.md).

These hooks are just local files in your home directory that live outside the chezmoi repo, and get run at specific times when your dotfiles initialize. So for instance, if you create a file at `~/.hooks/zshrc.after`, it will get sourced after the chezmoi managed `~/.zshrc` file. A perfect place to add any aliases you can't live without. For example:

```shell
touch ~/.hooks/zshrc.after
code ~/.zshrc
```

Read more in the [Hooks README.md](https://github.com/pgumeson-fabric/dotfiles/blob/main/dot_hooks/README.md):hook:

## Contributing

Let me know if you are interested in submitting PRs and I'll add you as a contributor:sunglasses:.
