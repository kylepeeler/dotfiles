# Dotbot Usage and Information

## What is it?

Dotbot is a dotfile [bootstrapper](https://en.wikipedia.org/wiki/Bootstrapping), allowing me to easily configure additional dot files without having to write a complicated and ugly bash script.

I encourage you to check out the [project's documentation here](https://github.com/anishathalye/dotbot).

Dotbot is self-contained within this repository as a git submodule, with no external dependencies and no installation required.

## Usage

### Upgrading dotbot

Since it is a submodule, running the following command should upgrade it

```bash
git submodule update --remote dotbot
```

before to commit changes before running `./install`, otherwise the old version of Dotbot will be checked out by the install script.

### What is linked?

The configuration for what dotbot does lives in `/init_dotfiles.sh`
