#!/bin/bash

# Cleanup first
rm MouseLocator.prefPane.tar.bz2

# Tar and then bzip
/usr/bin/tar cvf MouseLocator.prefPane.tar MouseLocator.prefPane
bzip2 -9v MouseLocator.prefPane.tar