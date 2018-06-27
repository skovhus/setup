#!/bin/bash

# Inspiration:
# - http://fredkelly.net/articles/2014/10/19/developing_on_yosemite.html
# - https://github.com/sorenvind/dev-env
# - https://github.com/mads-hartmann/dotfiles

# Set up OSX settings
echo "> Setting up OS X..."
./OSXsettings.sh

# Install homebrew and cask
if test ! $(which brew)
then
  echo "> Installing brew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  brew install caskroom/cask/brew-cask
fi

# Install latest zsh and oh-my-zsh
OMZ=~/.oh-my-zsh
if test ! -d $OMZ
then
  echo "> Installing oh my zsh..."
  brew install zsh
  curl -L http://install.ohmyz.sh | sh
fi

# Install common sanity
echo "> Installing common sanity..."
brew tap homebrew/dupes
brew update
brew upgrade
brew install awscli
brew install coreutils
brew install curl
brew install git
brew install gnu-sed
brew install go
brew install jq
brew install make
brew install node
brew install yarn
brew install python
brew install ruby
brew install scala
brew install wget

# Install other brew packages
echo "> Installing other brew package..."
brew tap caskroom/fonts
brew cask install font-fira-code
brew install pstree
brew install the_silver_searcher
brew install tree
brew install watchman

# up the limit for files opened
sudo launchctl limit maxfiles 2048 unlimited

# Install python packages
pip install requests virtualenv pep8 pylint flake8

# Symlink dot files
ln -fs $PWD/home/.zshrc ~
ln -fs $PWD/home/.ssh/config ~/.ssh

# move .gitconfig without e-mail
cp home/.gitconfig ~

# And oh my zsh theme
mkdir -p ~/.oh-my-zsh/themes/
ln -fs $PWD/skovhus.zsh-theme ~/.oh-my-zsh/themes/skovhus.zsh-theme

# Install Apps
echo "> Installing Apps you will like..."
brew cask install docker
brew cask install dropbox
brew cask install flux
brew cask install gitup
brew cask install google-chrome
brew cask install java
brew cask install jumpcut
brew cask install licecap
brew cask install mysql-utilities
brew cask install mysqlworkbench
brew cask install omnigraffle
brew cask install shiftit
brew cask install spotify
brew cask install sublime-text
brew cask install vlc
brew cask install visual-studio-code

# VS Code
echo "> Setting up VS Code..."
mkdir -p ~/Library/Application\ Support/Code/User
ln -fs $PWD/apps/vs-code/settings.json ~/Library/Application\ Support/Code/User
ln -fs $PWD/apps/vs-code/keybindings.json ~/Library/Application\ Support/Code/User
for module in `cat apps/vs-code/extensions.list`; do
    code --install-extension "$module" || true
done

# Sublime
echo "> Setting up Sublime"
mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
cp apps/Sublime/User/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/

echo "> Done!"

echo "-----------------------------------------"
echo "Manual steps:"
echo "-----------------------------------------"
echo "- Setup terminal to import solazried-dark theme, with Menlo Regular 10pt and block cursor."
echo "- add e-mail to ~/.gitconfig"
echo "- Fix all issues from running brew doctor"
echo "- Set up short cuts http://apple.stackexchange.com/questions/167967/creating-system-wide-keyboard-shortcut-to-launch-applications"
echo "- Configure shiftit, moom, jumpcut to start, etc..."
echo "- Open Sublime and install Package Control"
