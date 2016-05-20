#!/bin/sh

# Cleanup
rm -rf build/quota-notifier.pkg
rm -rf build/quota-notifier.dmg

# Build Package and wrap in DMG
munkipkg .
dropdmg build/quota-notifier.pkg

open build/