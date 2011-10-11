#!/usr/bin/python

'''Return the data for a shadow-hash file suitable for use in MacOS X'''

__version__ = int('$Revision: 371 $'.split(" ")[1])

def getShadowHashData(password, seedIntInput=None):
	import random, struct, hashlib
	
	'''A python re-write of the shadowHash PHP script by Pete Akins, Cincinnati, OH . pete.akins@uc.edu'''
	
	while 1:
		if seedIntInput is None:
			seedInt = random.randrange(1, 2**31 - 1)
		else:
			seedInt = seedIntInput # for unit testing
		
		seedHex = ("%x" % seedInt).upper().zfill(8)
		seedString = struct.pack(">L", seedInt)
		saltedPassword = hashlib.sha1(seedString + password).hexdigest().upper()
		
		if len(saltedPassword) == 40 or seedIntInput != None:
			break
	
	# NTLM 64 characters, sha1 40 characters, cram_md5 64 characters, the salted password, then recoverable 1024 characters
	return "%s%s%s%s" % ("0" * (64 + 40 + 64), seedHex, saltedPassword, "0" * 1024)

if __name__ == '__main__':
	import sys, os, optparse
	
	def print_version(option, opt, value, optionsParser):
		optionsParser.print_version()
		sys.exit(0)
	
	optionsParser = optparse.OptionParser("%prog [-f/--write-file] password", version="%%prog svn version: %s" % str(__version__))
	optionsParser.remove_option('--version')
	
	optionsParser.add_option("-f", "--write-file", type="string", default=None, dest="passwordFile", help="Write the password-hash to a file", metavar="FILE_PATH")
	optionsParser.add_option("-v", "--version", action="callback", callback=print_version, help="Print the version number and quit")
	options, password = optionsParser.parse_args()
	
	# --- police options ----
	
	if len(password) == 0:
		optionsParser.error("A single password to translate is required")
	elif len(password) > 1:
		optionsParser.error("Only a single password-hash can be created at a time")
	password = password[0]
	
	if options.passwordFile is not None:
		if os.path.exists(options.passwordFile) and not os.path.isfile(options.passwordFile):
			optionsParser.error("An item already exists at that path, and it is not a file")
		
		folderPath = os.path.dirname(options.passwordFile)
		
		if folderPath != '' and not os.path.isdir(folderPath):
			optionsParser.error("When using the -f/--write-file option the file path specified must be in a folder that already exists")
	options.passwordFile = os.path.realpath(os.path.normpath(options.passwordFile))
	
	# do the work
	
	shadowHashData = getShadowHashData(password)
	
	if options.passwordFile is not None:
		writeFile = open(options.passwordFile, 'w')
		writeFile.write(shadowHashData)
		writeFile.close()
	else:
		print(shadowHashData)
	
	sys.exit(0)