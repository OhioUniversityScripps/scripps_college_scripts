#!/bin/bash

defaults write com.apple.loginwindow TALLogoutSavesState 0
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false
defaults read com.apple.loginwindow