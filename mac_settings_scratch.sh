#!/bin/bash

# ******* Settings > MenuBar *******
defaults write "com.apple.controlcenter" "NSStatusItem Visible ScreenMirroring" -bool false
defaults delete "com.apple.Spotlight" "NSStatusItem Visible Item-0"

# ******* Settings > Dock *******
defaults write "com.apple.dock" "magnification" -bool false
defaults write "com.apple.dock" "tilesize" -int 37
defaults write "com.apple.dock" "autohide" -bool true
defaults write "com.apple.dock" "minimize-to-application" -bool true
killall Dock

# ******* Settings > Spotlight *******
defaults write "com.apple.assistant.support" "Search Queries Data Sharing Status" -int 2
defaults write "com.apple.Spotlight" "orderedItems" '({enabled=1;name=APPLICATIONS;},{enabled=1;name="MENU_EXPRESSION";},{enabled=1;name=CONTACT;},{enabled=1;name="MENU_CONVERSION";},{enabled=1;name="MENU_DEFINITION";},{enabled=1;name=DOCUMENTS;},{enabled=0;name="EVENT_TODO";},{enabled=1;name=DIRECTORIES;},{enabled=0;name=FONTS;},{enabled=1;name=IMAGES;},{enabled=0;name=MESSAGES;},{enabled=1;name=MOVIES;},{enabled=1;name=MUSIC;},{enabled=1;name="MENU_OTHER";},{enabled=1;name=PDF;},{enabled=0;name=PRESENTATIONS;},{enabled=1;name="MENU_SPOTLIGHT_SUGGESTIONS";},{enabled=1;name=SPREADSHEETS;},{enabled=1;name="SYSTEM_PREFS";},{enabled=0;name=TIPS;},{enabled=1;name=BOOKMARKS;},)'

# ******* Settings > Trackpad & Mouse *******
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 1
defaults write "Apple Global Domain" com.apple.swipescrolldirection -bool false
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

# ******* Settings > Finder *******
defaults write "com.apple.finder" "FXPreferredViewStyle" 'clmv'
defaults write "com.apple.finder" "SearchRecentsSavedViewStyle" 'clmv'
defaults write com.apple.finder ShowRecentTags -bool false
# Don't create some .DS_Store files
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
killall Finder
