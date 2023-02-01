#!/bin/bash

# Inspiration:
# - http://fredkelly.net/articles/2014/10/19/developing_on_yosemite.html
# - https://github.com/sorenvind/dev-env
# - https://github.com/mads-hartmann/dotfiles

set -euo pipefail

PREFIX='>'

# Set up OS settings
echo "$PREFIX Setting up OS settings..."
./mac-os-settings.sh

sudo xcode-select --install || true

# Install homebrew
export HOMEBREW_NO_ENV_HINTS=true
if test ! $(which brew)
then
  echo "$PREFIX Installing brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  brew doctor
fi


# up the limit for files opened
sudo launchctl limit maxfiles 2048 unlimited

echo "$PREFIX Brew: updating and upgrading..."
brew update
brew upgrade
brew tap homebrew/cask-fonts


echo "$PREFIX Brew: tapping..."
for module in `cat brew-packages.list`; do
    brew install "$module"
done

for module in `cat brew-casks.list`; do
    brew install --cask "$module"
done

# Install oh-my-zsh
OMZ=~/.oh-my-zsh
if test ! -d $OMZ
then
  echo "> Installing oh my zsh..."
  curl -L http://install.ohmyz.sh | sh
fi


echo "$PREFIX Install global python packages..."
pip3 install --quiet virtualenv pylint flake8


echo "$PREFIX Setup symlinks for dotfiles and shell stuff..."
# Symlink dot files
ln -fs $PWD/home/.zshrc ~
ln -fs $PWD/home/.ssh/config ~/.ssh

# move .gitconfig without e-mail
cp home/.gitconfig ~

# And oh my zsh theme
mkdir -p ~/.oh-my-zsh/themes/
ln -fs $PWD/skovhus.zsh-theme ~/.oh-my-zsh/themes/skovhus.zsh-theme


echo "$PREFIX Setting up VS Code..."
mkdir -p ~/Library/Application\ Support/Code/User
ln -fs $PWD/apps/vs-code/settings.json ~/Library/Application\ Support/Code/User
ln -fs $PWD/apps/vs-code/keybindings.json ~/Library/Application\ Support/Code/User
for module in `cat apps/vs-code/extensions.list`; do
    code --install-extension "$module" || true
done


echo "$PREFIX Done!"

echo "-----------------------------------------"
echo "Manual steps:"
echo "-----------------------------------------"
echo "- Setup terminal to import solarized.terminal profile"
echo "- add e-mail to ~/.gitconfig"
echo "- Fix all issues from running brew doctor"
echo "- Set up short cuts http://apple.stackexchange.com/questions/167967/creating-system-wide-keyboard-shortcut-to-launch-applications"
echo "- Install Moom from App Store"
echo "- Configure moom, log in to Dropbox, Chrome..."
