#!/usr/bin/env python
# Kahtan Al Jewary (aljewaryk@gmail.com) 2016
# Ricky Chilcott (chilcotr@ohio.edu) 2016

import subprocess
from subprocess import call
def diskUsage(path):
  command = "du -sh %s | awk \'{print $1}\'"  % path
  usage = subprocess.check_output(command, shell=True).replace("\n", "").strip()

  return(usage)
  
def diskHomeUsage():
  return diskUsage("$HOME")
  
# Will display an alert box with the specified message
def alert(message):
  command = "osascript -e \'tell app \"System Events\" to display dialog "
  command += "\"%s\" with title \"%s\" default button 1 buttons {\"OK\"} " %(message, title)
  command += "giving up after %s\'" % timeout
  call(command, shell=True)

# Will check the current usage and alert if needed
def checkUsageAndAlert(usage):
  denomination = usage[-1]
  value = float(usage[0:-1])
  
  if denomination != 'G' and denomination != 'T': # Not GB or TB.
    print "Less than 1 GB. Actually %s of usage." % usage
    return
  if denomination == 'T': # TERABYTES
    alert(over_quota_msg)
    return
  elif value <= softQuotaLimit:
    print "Below safe usage limit"
    return
  elif value < hardQuotaLimit:
    alert(close_to_quota_msg)
  else:
    alert(over_quota_msg)
  
  exit(0)

usage = diskHomeUsage()
# ============================
# Variables to change
# ============================

timeout = "150" #seconds (i.e. 2.5 mins)
title = "Home Usage Alert"
softQuotaLimit = 8 # GB
hardQuotaLimit = 10 # GB

close_to_quota_msg = "You are getting close to your %s of your %sG quota" % (usage, hardQuotaLimit)
over_quota_msg = "You are over your %sG quota. Currently have used %s. Delete files immediately and empty trash to continue using this computer." % (hardQuotaLimit, usage)

checkUsageAndAlert(usage)