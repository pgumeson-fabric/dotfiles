# Zipnosis Dotfiles

Maintained with [chezmoi](https://www.chezmoi.io/).

## Prerequisites on OS X

1. OS X Command Line Tools installed (or full XCode)
2. Git

**NOTE:** Opening a terminal and running `git -v` should walk
you through the process of installing xcode command line tools
if not already installed. Otherwise run `xcode-select --install`.

## Bootstrap Machine

First, make sure you have enabled admin privileges in Rippling.

Then run the following command to install `chezmoi` and boostrap your machine.

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply pgumeson-fabric
```

## That's It!
