#!/usr/bin/env python
# Kahtan Al Jewary (aljewaryk@gmail.com)

from subprocess import call

#-------------------------------------------------------------
# Get usage statistics and save to a temp file
#-------------------------------------------------------------
tempFile = "/tmp/usageStat.txt"
command = "du -sh $HOME | awk '{print $1}' > %s" % tempFile
call(command, shell=True)

f = open(tempFile, 'r')
usage = (f.readline()).replace("\n", "")
f.close()
#-------------------------------------------------------------

# Assign values to variables used in the alert box
timeout = "300"
title = "Disk Usage Alert"
message1 = "You are using %s of your 10G quota" % usage
message2 = "You are going over your 10G quota"
safeUsage = 8
unsafeUsage = 10

# Will display an alert box with the specified message
def alert(message):
  line1 = """ osascript -e 'tell app "System Events" to display dialog """
  line2 = """ "%s" with title "%s" default button 1 buttons {"OK"} """ %(message, title)
  line3 = """ giving up after %s' """ % timeout
  command = line1+line2+line3
  call(command, shell=True)

# Will check the current usage and alert if needed
def checkUsage(usage):
  if usage[-1] != 'G':
    return
  elif int(usage[0:-1]) <= safeUsage:
    return
  elif int(usage[0:-1]) <= unsafeUsage:
    alert(message1)
  else:
    alert(message2)

# Starts here
checkUsage(usage)