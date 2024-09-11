# Fabric Dotfiles

Maintained with https://chezmoi.io

**TLDR:** skip to [Installation](#installation):clap:

## Why? What does it do?

Getting a new machine up and running with all the tools you use (shells, editors, version control) can be consuming and error prone. Not to mention keeping up with new versions and breaking changes... Chezmoi tracks your personal configuration files (dotfiles like `~/.zshrc`) in git, and allows you to quickly restore your settings on any new or existing machine. It also allows common project configurations to be shared and updated across teams.

Read more about chezmoi here: [What does chezmoi do?](https://www.chezmoi.io/what-does-chezmoi-do), [Quick Start Guide](https://www.chezmoi.io/quick-start), [User Guide](https://www.chezmoi.io/user-guide/command-overview).

#### This `dotfiles` repo will do the following:

1. Installs [Homebrew](https://brew.sh/) and bundles your [Brewfile](https://github.com/pgumeson-fabric/dotfiles/blob/main/Brewfile.tmpl) :beer:
1. Installs and configures [pkgx](https://pkgx.sh), the new package manager from the creator of Homebrew, to replace the need for `rvm`, `rbenv`, `asdf`, `fvm`, etc.
1. Generates your SSH keypair and uploads your public key to your GitHub account :octocat:
1. Installs VSCode and [the best extensions](https://github.com/pgumeson-fabric/dotfiles/blob/main/Brewfile.tmpl#L61-L97)
1. Configures [starship cross-shell prompt](https://starship.rs) as your default prompt :rocket:
1. Opt-in [LazyVim](https://www.lazyvim.org) configuration for vim users :zzz:

#### Finally, it installs the [kitty terminal](https://sw.kovidgoyal.net/kitty):cat: and configures your `zsh` shell to look and function like this:
![pkgx-session](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/f26f8459-cdec-4f7e-97ad-53d383b8d7a9)

Of course, all these settings are totally customizable. But this `dotfiles` repo serves as a great starting point.

## Prerequisites on OS X

1. OS X `command-line-tools` installed (or a full `XCode` installation)
2. `git` installed and a GitHub account.

> [!NOTE]
> Opening a terminal and running `git -v` should walk you through the
> process of installing xcode command line tools (if not already installed).
> Otherwise run `xcode-select --install`.

3. Finally, if you have other package managers (such as `rvm`, `rbenv` or `asdf`) installed, they may conflict with `pkgx`.
The install script will take care of removing them, but just remember not to reinstall them or things may break in
unexpected ways :bomb:

> [!IMPORTANT]
> RVM is very invasive, so after uninstalling with `rvm implode`, you may need to logout and login to OS X to disable RVM's `cd` shell hooks 😐

## Prerequisites on Linux

Some linux support [already in place](https://github.com/pgumeson-fabric/dotfiles/blob/main/.chezmoi.toml.tmpl#L78-L79), but not tested.

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
Chezmoi will prompt you for a few things, like your email address for git commits and your preferred text editor (`VSCode`, `Neovim`, etc.). It will then walk you through all the installation steps and use those saved configs to setup everything customized for you.

### 4. That's it! :sparkles:
When you're finished, all you have to do is open a new `kitty` terminal and your new .zshrc will be loaded with your settings. :cat:

<br>

> [!IMPORTANT]
> If on chezmoi's first run, the installation detects that you have files in your home directory that would be overwritten,
> you will be prompted to back them up to your `~/.dotfilebackups` directory. That way you can always restore specific files,
> or go all the way back to the way things were.

![backup-home](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/baf95ee9-ac4d-41fb-969e-c20e0f7acede)

<br>

> [!NOTE]
> During the initial installation you will be guided through the process of generationg your SSH keypair and uploading the public key to your GitHub account.<br>
> **This will not overwrite or affect any existing SSH keys you currently have**!<br>
> However, if you current SSH key uses an older encryption method like `rsa` insted of `ed25519`, then you should delete your older keys from your GitHub account.:key:

![ssh-keygen](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/2236f6bf-2584-420b-99b2-dea7779d6450)

#### Your new public key in GitHub :octocat:

![github-key](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/caa19057-7b8b-4cf4-ac87-752b59b19967)

> [!IMPORTANT]
> Of course it will use your `user` and `laptop` name for the public key title, not mine :name_badge:

<br>

# Development

## pkgx

With [pkgx](https://pkgx.sh), simply run the `dev` command to let pkgx know the current directory is a project. It will try to figure out all the dependencies based on the contents of the directory. You can also create a file called `pkgx.yaml` to explicitly define dependencies to be instsalled and `ENV` variables to be set.

![pkgx-dev](https://github.com/pgumeson-fabric/dotfiles/assets/145386658/a8872ddf-fb14-436a-b3de-3ea045affb05)

> [!NOTE]
> Pkgx packages are only installed to your path for the current project! :purple_heart:<br>
> See: https://docs.pkgx.sh/using-dev/dev

# Chezmoi Usage

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

These hooks are just local files in your home directory that live outside the chezmoi repo, but still get run at specific times when you open a new terminal.
So instead of putting shell customizations in `~/.zshrc` (which is managed by chezmoi), favor adding them in `~/.zlogin`. By default, zsh will source `.zlogin` right after `~/.zshrc`, making it the perfect place to add any aliases or zsh customizations that are specific only to you. For example:

```shell
touch ~/.zlogin
code ~/.zlogin
```

Read more in the [Hooks README.md](https://github.com/pgumeson-fabric/dotfiles/tree/main/private_dot_config/hooks#readme):hook:

# Contributing

Let me know if you are interested in submitting PRs and I'll add you as a contributor. :nerd_face:

### Wishlist
- [x] Backup home directory on first run
- [x] Customization hooks :hook:
- [ ] Auto-clone our projects to local projects dir and configure
- [x] Sunset asdf once pkgx supports all the package versions we're using
- [ ] Fish shell support :fish:
- [ ] Opt-in React tools and environment
- [ ] [Opt-in Flutter tools and environment](https://github.com/pgumeson-fabric/dotfiles/pull/1) :bird:
- [ ] Secure retreival of files from passowrd manager :closed_lock_with_key:
- [x] LazyVim config :zzz:
- [ ] Opt-in for Emacs editor
