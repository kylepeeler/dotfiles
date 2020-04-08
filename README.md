# Kyle Peeler's dotfiles

![Screenshot](https://p-zkfgg0j.t2.n0.cdn.getcloudapp.com/items/YEu1q15n/CleanShot%202020-04-08%20at%2012.09.47%402x.png)

These are my dotfiles. Use at your own risk, they are what work for me and may update at anytime. 

***Do not blindly install them without reading every line of code.***
If you are planning to use them for yourself, please fork it before cloning and installing. 

These target macOS systems.

## Package Overview
I have put a lot of time in configuring my system in a way that works for me, and I want to maintain it's history, and share it with the world.

Additionally, I now have multiple machines, and I want to keep a common configuration of my development enviornment synchronized and version controlled across them. 

In order to accomplish this, `./install` file linking the configurations is [idempotent](https://en.wikipedia.org/wiki/Idempotence), meaning it can be sourced multiple times without harm (only pulling the _latest_ configuration).

I have also included `init/init_machine.sh` script for me to easily provision a brand new machine on a fresh copy of macOS. _This is not idempotent._

All files are bootstrapped with [dotbot](https://github.com/anishathalye/dotbot). 

## TO DO:
- [x] Run through execution order, everything should work okay?
- [ ] VS Code configuration settings
- [ ] Flesh out documentation

## Install Instructions

### Fresh macOS Install Instructions
1. First things first, we need git to clone this... install command line tools
```bash
xcode-select --install
```

2. Clone this repo into the user's home directory
```bash
cd $HOME
git clone https://github.com/kylepeeler/dotfiles
```

3. Copy over secrets folder
```bash
<obtain the files using magic>
cp secrets ~/dotfiles/secrets
```

4. Run the init_machine.sh script
```bash
chmod +x ~/dotfiles/init/init_machine.sh
./dotfiles/init/init_machine.sh
```

5. Install the iTerm 2 profile
Load the profile found in `~/.item-profiles` into iTerm

### Keeping changes in sync across machines

Simply run
```
cd ~/dotfiles && ./install
```


## Further Documentation

* [Maintaining this repo](docs/maintenance.md)
* [Guide to using Dotbot](docs/using-dotbot.md)
* [Resources/Inspiration for this Project](docs/resources.md)

## Feedback
Suggestions/improvements welcome! If you have any, please submit an issue here.

## Special Thanks
* @wuz and his dotfiles & setup script
* @mathiasbynens dotfiles & mac setup script
* anyone else [listed here](docs/resources.md) 
