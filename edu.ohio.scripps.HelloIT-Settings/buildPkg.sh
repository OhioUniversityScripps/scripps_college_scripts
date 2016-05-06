#!/bin/sh

# Cleanup
rm -rf build/HelloIT-Settings.pkg
rm -rf build/HelloIT-Settings.dmg

# Build Package and wrap in DMG
munkipkg .
dropdmg build/HelloIT-Settings.pkg

open build/