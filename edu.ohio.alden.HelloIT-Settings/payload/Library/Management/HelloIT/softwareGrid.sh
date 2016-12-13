#!/bin/sh

echo "hitp-enabled: YES"
echo "hitp-title: Copy Software Grid"
echo "hitp-state: none"

##This line copies to the clipboard the output of the softwareGrid.py script if the argument "run" is passed.
if [ "$1" == "run" ]; then
  /Library/Management/HelloIT/softwareGrid.py | pbcopy
fi