#!/bin/bash

#  _   __      _       ______         _           _
# | | / /     | |      | ___ \       | |         ( )
# | |/ / _   _| | ___  | |_/ /__  ___| | ___ _ __|/ ___
# |    \| | | | |/ _ \ |  __/ _ \/ _ \ |/ _ \ '__| / __|
# | |\  \ |_| | |  __/ | | |  __/  __/ |  __/ |    \__ \
# \_| \_/\__, |_|\___| \_|  \___|\___|_|\___|_|    |___/
#         __/ |
#         |___/        New Dev Enviornment Provisioning Script

# This is my new machine setup script - it's heavily adapted to my usecases
# The code is CC0[1] so feel free to rework and reuse as you see fit.

# Extensively inspired and reworked from:
# https://github.com/nnja/new-computer
# and https://github.com/wuz/setup.wuz.sh


####################
# Helper functions #
####################

# Colorize

# Set the colours you can use
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)

# Resets the style
reset=$(tput sgr0)

show_spinner()
{
  local -r pid="${1}"
  local -r delay='0.5'
  SYMBOLS='⣾ ⣽ ⣻ ⢿ ⡿ ⣟ ⣯ ⣷'
  SPINNER_PPID=$(ps -p "${pid}" -o ppid=)
  while ps a | awk '{print $1}' | grep -q "${pid}"; do
    tput civis
    for c in ${SYMBOLS}; do
      local COLOR
      COLOR=$(tput setaf 5)
      tput sc
      env printf "${COLOR}${c}${SPINNER_NORMAL}"
      tput rc
      env sleep .2
      if [ ! -z "$SPINNER_PPID" ]; then
        SPINNER_PARENTUP=$(ps $SPINNER_PPID)
        if [ -z "$SPINNER_PARENTUP" ]; then
          break 2
        fi
      fi
    done
  done
  tput cnorm
}

spinner() {
  ("$@") &
  show_spinner "$!"
}

# Color-echo. Improved. [Thanks @joaocunha]
# arg $1 = message
# arg $2 = Color
cecho() {
  echo "${2}${1}${reset}"
  return
}

dot() {
  src=$1
  dest=$2
  args=$3
  regex='(https?|ftp|file)://[-A-Za-z0-9\+&@#/%?=~_|!:,.;]*[-A-Za-z0-9\+&@#/%=~_|]'
  if [[ $src =~ $regex ]]
  then
    curl -s "$src" > "$dest"
  else
    base=${3:-"git@github.com"}
    git clone "$base:$src" "$dest" "$args"
  fi
}

echo ""
cecho "###############################################" "$red"
cecho "#        THIS IS CURRENTLY ONLY FOR MAC       #" "$red"
cecho "#                                             #" "$red"
cecho "#---------------------------------------------#" "$red"
cecho "#                                             #" "$red"
cecho "#        DON'T RUN CODE YOU FIND ON THE       #" "$red"
cecho "#      INTERNET WITHOUT READING IT FIRST      #" "$red"
cecho "#        YOU'LL EVENTUALLY REGRET IT...       #" "$red"
cecho "#                                             #" "$red"
cecho "#---------------------------------------------#" "$red"
cecho "#                                             #" "$red"
cecho "#          READ THIS CODE THOROUGHLY          #" "$red"
cecho "#         AND EDIT TO SUIT YOUR NEEDS         #" "$red"
cecho "###############################################" "$red"
echo ""

# Set continue to false by default.
CONTINUE=false

echo ""
cecho "Have you read through the script you're about to run and " "$blue"
cecho "understood that it will make changes to your computer? (y/n)" "$blue"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  CONTINUE=true
fi

if ! $CONTINUE; then
  # Check if we're continuing and output a message if not
  cecho "Please go read the script, it only takes a few minutes" "$red"
  exit
fi

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

##############################
# Prerequisite: Install Brew #
##############################

echo "Installing brew..."

if test ! "$(command -v brew)"
then
  ## Don't prompt for confirmation when installing homebrew
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
fi

# Update brew
echo "Updating/Upgrading Brew"
spinner brew upgrade
spinner brew update

#############################################
### Generate ssh keys & add to ssh-agent
### See: https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
#############################################

echo "Generating ssh keys, adding to ssh-agent..."
read -p 'Input email for ssh key: ' useremail

echo "Using default ssh file location, enter a passphrase: "
ssh-keygen -t rsa -b 4096 -C "$useremail"  # will prompt for password
eval "$(ssh-agent -s)"

# Now that sshconfig is synced add key to ssh-agent and
# store passphrase in keychain
ssh-add -K ~/.ssh/id_rsa

# If you're using macOS Sierra 10.12.2 or later, you will need to modify your ~/.ssh/config file to automatically load keys into the ssh-agent and store passphrases in your keychain.

if [ -e ~/.ssh/config ]
then
    echo "ssh config already exists. Skipping adding osx specific settings... "
else
	echo "Writing osx specific settings to ssh config... "
   cat <<EOT >> ~/.ssh/config
	Host *
		AddKeysToAgent yes
		UseKeychain yes
		IdentityFile ~/.ssh/id_rsa
EOT
fi

#############################################
### Add ssh-key to GitHub via api
#############################################

echo "Adding ssh-key to GitHub (via api)..."
echo "Important! For this step, use a github personal token with the admin:public_key permission."
echo "If you don't have one, create it here: https://github.com/settings/tokens/new"

retries=3
SSH_KEY=`cat ~/.ssh/id_rsa.pub`

for ((i=0; i<retries; i++)); do
      read -p 'GitHub username: ' ghusername
      read -p 'Machine name: ' ghtitle
      read -sp 'GitHub personal token: ' ghtoken

      gh_status_code=$(curl -o /dev/null -s -w "%{http_code}\n" -u "$ghusername:$ghtoken" -d '{"title":"'$ghtitle'","key":"'"$SSH_KEY"'"}' 'https://api.github.com/user/keys')

      if (( $gh_status_code -eq == 201))
      then
          echo "GitHub ssh key added successfully!"
          break
      else
	  echo "Something went wrong. Enter your credentials and try again..."
	  echo -n "Status code returned: "
	  echo $gh_status_code
      fi
done

[[ $retries -eq i ]] && echo "Adding ssh-key to GitHub failed! Try again later."

######################
# Install oh-my-zsh
######################
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "oh-my-zsh installed!"

######################
# Install vim plug
######################
echo "Installing vim-plug..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# TODO: automate this...
echo "Vim Plug Installed! Remember to do a :PlugInstall upon launching!"

######################
# Install asdf + langs
######################
# echo "Installing asdf..."
# dot asdf-vm/asdf.git "$HOME/.asdf" "--branch v0.7.8"
# TODO: swap out for mise-en-place

####################
# Install dotfiles #
####################
echo "Making dot installer executable..."
chmod +x "$HOME/dotfiles/install"
echo "Bootstrapping with dotbot..."
source "$HOME/dotfiles/install"
echo "Dotfiles bootstrapped and linked!"

################
# MacOS settings
################
echo "Sourcing mac_settings.sh..."
source ./mac_settings.sh

echo ""
cecho "Boom! All done!" "$cyan"
echo ""
echo ""
cecho "################################################################################" "$white"
echo ""
echo ""
cecho "Note that some of these changes require a logout/restart to take effect." "$red"
echo ""
echo ""
echo -n "Check for and install available OSX updates, install, and automatically restart? (y/n)? "
read -r response
if [ "$response" != "${response#[Yy]}" ] ;then
    softwareupdate -i -a --restart
fi
exit 0

# [1] - https://creativecommons.org/share-your-work/public-domain/cc0/
