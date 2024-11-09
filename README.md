# Kyle Peeler's dotfiles

![Screenshot](https://p-zkfgg0j.t2.n0.cdn.getcloudapp.com/items/YEu1q15n/CleanShot%202020-04-08%20at%2012.09.47%402x.png)

These are my dotfiles. Use at your own risk, they are what work for me and may update at anytime.

***Do not blindly install them without reading every line of code.***
If you are planning to use them for yourself, please fork it before cloning and installing.

These target *latest* macOS systems.

## Package Overview

I have put a lot of time in configuring my system in a way that works for me, and I want to maintain it's history, and share it with the world.

Additionally, I now have multiple machines, and I want to keep a common configuration of my development environment synchronized and version controlled across them.

In order to accomplish this, `./install` file linking the configurations is [idempotent](https://en.wikipedia.org/wiki/Idempotence), meaning it can be sourced multiple times without harm (only pulling the *latest* configuration).

All files are bootstrapped with [dotbot](https://github.com/anishathalye/dotbot).

# Install Instructions

## Fresh macOS Install Instructions

1. First things first, we need git to clone this... install command line tools

```bash
xcode-select --install
```

2. Add SSH keys to github.

[See directions here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)

3. Clone this repo into the user's home directory

```bash
cd ~
git clone git@github.com:kylepeeler/dotfiles.git
```

4. Copy over secrets folder

```bash
<obtain the files using magic/airdrop>
cp -r secrets ~/dotfiles/secrets
```

5. Install [Brew](https://brew.sh/)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

6. Install [oh-my-zsh](https://ohmyz.sh/#install)

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

7. Install brew packages

```bash
brew install mise
brew install starship
brew install delta
brew install fzf
brew install eza
brew install tmux
brew install mcfly
brew install nvim
brew install z
brew install thefuck
brew install gnupg
brew install iconsur
brew install reattach-to-user-namespace
```

1. Configure [mise-en-place](https://mise.jdx.dev/getting-started.html)

 Install nodejs + set global version

```bash
mise use --global node@22
```

1. Install [`vim-plug`](https://github.com/junegunn/vim-plug)

> ⚠️  Make sure you install the Neovim version, not normal Vim!

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

<!-- TODO: FIX ME!
4. Run the init_machine.sh script
```bash
chmod +x ~/dotfiles/init/init_machine.sh
./dotfiles/init/init_machine.sh
``` -->

## Other Stuff

### Keeping changes in sync across machines

Simply run

```bash
cd ~/dotfiles

# You may or may not need to init the dotbot submodule prior to updating
git submodule update --init dotbot

# Update to get the latest version of dotbot
git submodule update --remote dotbot

# Save/Commit against dotfiles w/ updated SHA
git commit -am "update dotbot"

# Make sure install script has permission
chmod +x ./install

# Run the install script, it will report what it does/any errors.
./install
```

### First Time Setup

#### Configuring Neovim

1. Make sure you close and reopen your terminal
2. Make sure Vim-Plug was installed (TODO: automate this)
3. Open up nvim, and run `:PlugInstall`

#### Fixing Fonts

1. Make sure to install NERD fonts

<!-- #### Install the iTerm 2 profile

1. Load the profile found in `~/.item-profiles` into iTerm

```bash
brew tap homebrew/cask-fonts &&
brew install --cask font-<FONT NAME>-nerd-font
``` -->

#### Fix Key Repeat in VS Code

Run the following commands

```bash
# For VSCode
defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

# For VSCode Insiders
defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false

# For VSCodium
defaults write com.visualstudio.code.oss ApplePressAndHoldEnabled -bool false

# To enable global key-repeat
# this is helpful if you're using Vim in a PWA like code-server
defaults write -g ApplePressAndHoldEnabled -bool false
```

## To-do... someday

I have also included `init/init_machine.sh` script for me to easily provision a brand new machine on a fresh copy of macOS. *This is not idempotent.*

While I have a more extensive scripts in the `init` folder including the above, and `mac_settings.sh`....

 Now a days, I tend to leave things at defaults, so I just selectively go through these files and run the commands that seem relevant. I will try to comment out the ones I don't use, but they are subject to change, and I don't run this file as often as I keep the base config files up to date.

Someday:

- [ ] Fix init script/add unit tests
- [ ] VS Code configuration settings
- [ ] Add list of apps to install using brew cask

## Further Documentation

- [Maintaining this repo](docs/maintenance.md)
- [Guide to using Dotbot](docs/using-dotbot.md)
- [Resources/Inspiration for this Project](docs/resources.md)

## Feedback

Suggestions/improvements welcome! If you have any, please submit an issue here.

## Special Thanks

- [@wuz](https://github.com/wuz) and his dotfiles & setup script
- [@mathiasbynens](https://github.com/mathiasbynens) dotfiles & mac setup script
- anyone else [listed here](docs/resources.md)
