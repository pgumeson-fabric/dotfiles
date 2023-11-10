# Zipnosis Dotfiles

Maintained with https://chezmoi.io

## Why? What does it do?

Getting a new machine up and running with all the tools you use (shells, editors, version control) can be very consuming and error prone. Not to mention keeping up with new versions and breking changes... Chezmoi tracks your personal configuration files (dotfiles like `~/.zshrc`) in git, and can quickly restore your settings on any new or existing machine. It also allows common project configurations to be shared and updated across teams.

Read more about chezmoi here: [What does chezmoi do?](https://www.chezmoi.io/what-does-chezmoi-do), [Quick Start Guide](https://www.chezmoi.io/quick-start), [User Guide](https://www.chezmoi.io/user-guide/command-overview).

#### This `dotfiles` repo will do the following:

1. Installs [Homebrew](https://brew.sh/) and bundles your [Brewfile](https://github.com/pgumeson-fabric/dotfiles/blob/main/Brewfile.tmpl):beer:
1. Installs [asdf](https://asdf-vm.com/) and ruby plugin for managing your ruby versions in our projects.
1. Installs and configures [pkgx](https://pkgx.sh), the new package manager from the creator of Homebrew.
1. Configures [direnv](https://direnv.net) for setting project specific PATH and ENV vars in an `.envrc` file.
1. Generates your SSH keypair and uploads your public key to your Github account:key:
1. Installs VSCode and [the best extensions](https://github.com/pgumeson-fabric/dotfiles/blob/main/Brewfile.tmpl#L57-L88).
1. Optional [neovim](https://neovim.io) configuration for vim users.

#### Finally, it installs the [kitty terminal](https://sw.kovidgoyal.net/kitty)🐱 and configures your `zsh` shell and prompt to look like this:
![terminal](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/a9a70308-c093-4d38-9de0-19417226b327)

Of course, all these settings are totally customizable. But this `dotfiles` repo serves as a great starting point.

## Prerequisites on OS X

1. OS X `command-line-tools` installed (or a full `XCode` installation)
2. `git` installed and a GitHub account.

**NOTE:** Opening a terminal and running `git -v` should walk
you through the process of installing xcode command line tools
(if not already installed). Otherwise run `xcode-select --install`.

## Bootstrap Machine

#### 1. First, make sure you have enabled admin privileges in Rippling
![rippling-admin](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/fe543828-1d1f-4472-96ba-96bb869ae9fb)

#### 2. Then run the following command to install `chezmoi` and boostrap your machine.

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply pgumeson-fabric
```

#### 3. Follow the prompts
Chezmoi will prompt you for things like your git email address and your preferred text editor (`VSCode`, `neovim`, etc.). It will then walk you through all the installation steps and use those saved configs to setup everything customized for you.

Chezmoi is also fully idempotent and will prompt before overwriting anything, so it's safe to run even if you have existing configs or homebrew installation. However if you choose not to overwrite important files like `.zshrc` then it can't really work as intended. More soon about backing up exising configs.

That's it!

## Daily Usage

Once you're all bootstrapped using the above instructions, chezmoi will be in your PATH and you can run commands like `chezmoi update -v` to pull down latest changes and apply them to your home directory.

## Customizing and Contributing

Instructions on how to make local customizations and submit upstream coming soon.
