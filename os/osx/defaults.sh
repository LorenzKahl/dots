# OSX for Hackers (Mavericks/Yosemite)
#
# Source: https://gist.github.com/brandonb927/3195465

#!/bin/sh

# Some things taken from here
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# Ask for the administrator password upfront
sudo -v

echo "This script will make your Mac awesome"

###############################################################################
# General UI/UX
###############################################################################

echo ""
echo "Increasing the window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo ""
echo "Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo ""
echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
echo ""
echo "Displaying ASCII control characters using caret notation in standard text views"
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

# echo ""
# echo "Disabling system-wide resume"
# defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

# echo ""
# echo "Disabling automatic termination of inactive apps"
# defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

# echo ""
# echo "Saving to disk (not to iCloud) by default"
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo ""
echo "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# echo ""
# echo "Never go into computer sleep mode"
# systemsetup -setcomputersleep Off > /dev/null

echo ""
echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo ""
echo "Disable smart quotes and smart dashes as theyâ€™re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

echo ""
echo "Disable natural scrolling"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
###############################################################################

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo ""
echo "Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

echo ""
echo "Disabling press-and-hold for keys in favor of a key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

echo ""
echo "Setting a blazingly fast keyboard repeat rate (ain't nobody got time fo special chars while coding!)"
defaults write NSGlobalDomain KeyRepeat -int 0

# echo ""
# echo "Disabling auto-correct"
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo ""
echo "Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

echo ""
echo "Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

echo ""
echo "Set scroll direction"
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

echo ""
echo "Tap to click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true



###############################################################################
# Screen
###############################################################################

# echo ""
# echo "Requiring password immediately after sleep or screen saver begins"
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0

echo ""
echo "Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo ""
echo "Enable HiDPI display modes (requires restart)"
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Finder
###############################################################################

echo ""
echo "Do not show icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

echo ""
echo "Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo ""
echo "Showing status bar in Finder by default"
defaults write com.apple.finder ShowStatusBar -bool true

echo ""
echo "Allowing text selection in Quick Look/Preview in Finder by default"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo ""
echo "Displaying full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo ""
echo "Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo ""
echo "Use list-view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Nlsv

echo ""
echo "Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# echo ""
# echo "Disabling disk image verification"
# defaults write com.apple.frameworks.diskimages skip-verify -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
# defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo ""
echo "Enabling snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

echo ""
echo "When performing a search, search the current folder by default"
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"


###############################################################################
# Dock & Mission Control
###############################################################################

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you donâ€™t use
# the Dock to launch apps.
# defaults write com.apple.dock persistent-apps -array

echo ""
echo "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

echo ""
echo "Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

echo ""
echo "Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
# defaults write com.apple.dock autohide-delay -float 0
# defaults write com.apple.dock autohide-time-modifier -float 0


###############################################################################
# Safari & WebKit
###############################################################################

echo ""
echo "Hiding Safariâ€™s bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo ""
echo "Hiding Safariâ€™s sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

# echo ""
# echo "Disabling Safariâ€™s thumbnail cache for History and Top Sites"
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo ""
echo "Enabling Safariâ€™s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo ""
echo "Making Safariâ€™s search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo ""
echo "Removing useless icons from Safariâ€™s bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo ""
echo "Allow hitting the Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

echo ""
echo "Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo ""
echo "Adding a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


###############################################################################
# Mail
###############################################################################

echo ""
echo "Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false


###############################################################################
# Terminal
###############################################################################

echo ""
echo "Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"


###############################################################################
# Time Machine
###############################################################################

echo ""
echo "Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# echo ""
# echo "Disabling local Time Machine backups"
# hash tmutil &> /dev/null && sudo tmutil disablelocal


###############################################################################
# Messages                                                                    #
###############################################################################

# echo ""
# echo "Disable automatic emoji substitution (i.e. use plain text smileys)"
# defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

echo ""
echo "Disable smart quotes as itâ€™s annoying for messages that contain code"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

echo ""
echo "Disable continuous spell checking"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false


###############################################################################
# Calendar
###############################################################################

echo ""
echo "Show week numbers"
defaults write com.apple.iCal "Show Week Numbers" -bool true

echo ""
echo "Show 7 days"
defaults write com.apple.iCal "n days of week" -int 7

echo ""
echo "Week starts on monday"
defaults write com.apple.iCal "first day of week" -int 1

echo ""
echo "Show event times"
defaults write com.apple.iCal "Show time in Month View" -bool true


###############################################################################
# Archive Utility
###############################################################################

echo ""
echo "Move archives to trash after extraction"
defaults write com.apple.archiveutility "dearchive-move-after" -string "~/.Trash"

echo ""
echo "Don't reveal extracted items"
defaults write com.apple.archiveutility "dearchive-reveal-after" -bool false


###############################################################################
# Personal Additions
###############################################################################

# echo ""
# echo "Disable hibernation (speeds up entering sleep mode)"
# sudo pmset -a hibernatemode 0

# echo ""
# echo "Remove the sleep image file to save disk space"
# sudo rm /Private/var/vm/sleepimage
# echo "Creating a zero-byte file insteadâ€¦"
# sudo touch /Private/var/vm/sleepimage
# echo "â€¦and make sure it canâ€™t be rewritten"
# sudo chflags uchg /Private/var/vm/sleepimage

# echo ""
# echo "Disable the sudden motion sensor as itâ€™s not useful for SSDs"
# sudo pmset -a sms 0

# echo ""
# echo "Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
# sudo pmset -a standbydelay 86400

# echo ""
# echo "Disable computer sleep and stop the display from shutting off"
# sudo pmset -a sleep 0
# sudo pmset -a displaysleep 0

echo ""
echo "Disable annoying backswipe in Chrome"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

###############################################################################
# Kill affected applications
###############################################################################

echo "Done!"
