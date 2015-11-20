#!/bin/bash

#Modify .sesi_licenses.pref to point to the currently logged in machine
echo "serverhost=$(hostname)" > $HOME/.sesi_licenses.pref