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
1. Generates your SSH keypair and uploads your public key to your GitHub account:key:
1. Installs VSCode and [the best extensions](https://github.com/pgumeson-fabric/dotfiles/blob/main/Brewfile.tmpl#L57-L88).
1. Optional [Neovim](https://neovim.io) configuration for vim users.

#### Finally, it installs the [kitty terminal](https://sw.kovidgoyal.net/kitty)🐱 and configures your `zsh` shell and prompt to look like this:
![terminal](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/a9a70308-c093-4d38-9de0-19417226b327)

Of course, all these settings are totally customizable. But this `dotfiles` repo serves as a great starting point.

## Prerequisites on OS X

1. OS X `command-line-tools` installed (or a full `XCode` installation)
2. `git` installed and a GitHub account.

**NOTE:** Opening a terminal and running `git -v` should walk you through the
process of installing xcode command line tools (if not already installed).
Otherwise run `xcode-select --install`.

## Bootstrap Machine

#### 1. First, make sure you have enabled admin privileges in Rippling
![rippling-admin](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/fe543828-1d1f-4472-96ba-96bb869ae9fb)

#### 2. Then run the following command to install `chezmoi` and boostrap your machine.

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/bin init --apply pgumeson-fabric
```

#### 3. Follow the prompts
Chezmoi will prompt you for a few things, like your git email address and your preferred text editor (`VSCode`, `Neovim`, etc.). It will then walk you through all the installation steps and use those saved configs to setup everything customized exactly for you.

If the installation detects that you have files in your home directory that will be overwritten on chezmoi's first run, you will be prompted to back them up. That way you can restore specific files, or go all the way back to the way things were.

That's it!:sunglasses:

## Daily Usage

Once you're all bootstrapped using the above instructions, chezmoi will be in your PATH and you can run commands like `chezmoi update -v` to pull down latest changes and apply them to your home directory. Chezmoi is fully idempotent, so it will only install new packages or apply updates that have changed.

## Customizing and Contributing

Coming soon... instructions on how to customize locally and submit features and improvements.
