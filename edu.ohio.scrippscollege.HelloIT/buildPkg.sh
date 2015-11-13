#!/bin/sh

../munki-pkg/munkipkg --sync .
../munki-pkg/munkipkg --export-bom-info .