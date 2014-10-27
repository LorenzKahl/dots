#
# Application installer (via brew-cask)
#

set -e

# Apps
apps=(
  dropbox
  onepassword
  alfred
  skitch1
  sizeup
  google-chrome
  appcleaner
  firefox
  hazel
  seil
  spotify
  iterm2
  virtualbox
  qlcolorcode
  qlprettypatch
  qlmarkdown 
  qlstephen
  quicklook-json
  sublime-text3
  webstorm
  skitch
  ksdiff
  mamp
)

# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
)

# Specify the location of the apps
appdir="/Applications"

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

main() {

  # Ensure homebrew is installed
  homebrew

  # Install homebrew-cask
  echo "installing cask..."
  brew tap phinze/homebrew-cask
  brew install brew-cask

  # Tap alternative versions
  brew tap caskroom/versions

  # Tap the fonts
  brew tap caskroom/fonts

  # install apps
  echo "installing apps..."
  brew cask install --appdir=$appdir ${apps[@]}

  # install fonts
  echo "installing fonts..."
  brew cask install ${fonts[@]}

  # link with alfred
  alfred
  cleanup
}

homebrew() {
  if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
}

alfred() {
  brew cask alfred link

  # allow Alfred to use the ~/Dropbox/Apps folder
  defaults write com.runningwithcrayons.Alfred-Preferences dropbox.allowappsfolder -bool TRUE
}

cleanup() {
  brew cleanup
}

main "$@"
exit 0
