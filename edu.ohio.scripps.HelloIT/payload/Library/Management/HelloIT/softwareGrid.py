#!/usr/bin/env python

#Kahtan Al Jewary (aljewaryk@gmail.com)
#This script utilizes [system_profiler] command to create an HTML table of 
#{app name: version} combinations.


import plistlib
import os
from subprocess import call


#Assign Paths
excludeAppListPath = "/tmp/excludeApps.txt"
rawPath = "/tmp/raw.xml"
url = "https://raw.githubusercontent.com/OhioUniversityScripps/scripps_college_scripts/master/SoftwareGridExcludeList/excludeApps.txt"


#Create the raw apps list file using system_profiler command and download ecludeApps.txt
call("/usr/sbin/system_profiler -xml SPApplicationsDataType > %s" %(rawPath), shell=True)
call("/usr/bin/curl %s -o /tmp/excludeApps.txt" %(url), shell=True)


#Read the raw apps list file and the list for apps to be excluded
rawFile = plistlib.readPlist(rawPath)
excludeAppList = open(excludeAppListPath).read().splitlines()


#Declare a dictionary named "apps" to hold {app name: version}
apps = {}


#Extract {apps names: versions} from the raw apps list and
#save them to the "apps" dictionary
for item in rawFile[0]['_items']:
	if 'version' in item and str(item['_name']) not in excludeAppList:
		key = str(item['_name'])
		value = str(item['version'])
		apps[key] = value


#A function to convert "apps" dictionary into an HTML table
def html_table(dict, colHeader1, colHeader2):
	print '<!DOCTYPE html>'
	print '<html>'
	print '<head>'
	print '<style>'
	print 'table, th, td {'
	print '    border: 1px solid black;'
	print '    border-collapse: collapse;'
	print '}'
	print 'th, td {'
	print '    padding: 5px;'
	print '    text-align: left;'
	print '}'
	print '</style>'
	print '</head>'
	print '<body>'
	print '<table style="width:30%">'
	print '   <tr>'
	print '       <th>%s</td>' %(colHeader1)
	print '       <th>%s</td>' %(colHeader2)
	print '   </tr>'
	for name, version in sorted(apps.items()):
		print'  <tr>'
		print'     <td>%s</td>' %(name)
		print'     <td>%s</td>' %(version)
		print'  </tr>'
	print '</table>'
	print '</body>'
	print '</html>'


#Output an HTML table with alphabetically sorted "apps names" and "versions"
html_table(apps, "Application Name", "Version")