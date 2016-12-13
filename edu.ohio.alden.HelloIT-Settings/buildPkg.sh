#!/bin/sh

# Cleanup
rm -rf build/Alden-HelloIT-Settings.pkg
rm -rf build/Alden-HelloIT-Settings.dmg

# Build Package and wrap in DMG
munkipkg --sync .
munkipkg .
dropdmg build/Alden-HelloIT-Settings.pkg

open build/