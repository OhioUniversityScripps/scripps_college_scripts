#!/usr/bin/python
import sys, tempfile, hashlib, urllib, urllib2, StringIO, os, subprocess, ConfigParser

TempPath = tempfile.mkdtemp()
AppConfig = ConfigParser.ConfigParser()
EUID = os.geteuid()

def ConfigSectionMap(config, section):
    dict1 = {}
    options = config.options(section)
    for option in options:
        try:
            dict1[option] = config.get(section, option)
            if dict1[option] == -1:
                DebugPrint("skip: %s" % option)
        except:
            print("exception on %s!" % option)
            dict1[option] = None
    return dict1

def settingsFilePath():
    if len(sys.argv) == 2 and sys.argv[1] != '':
        return "{0}{1}".format(sys.argv[1], "/Contents/Resources/settings.ini")
    else:
        print "Please specify Unity Download Assistant.app app path"
        exit(1)

def downloadAndInstallFromSettingsURL(url):
    settings = settingsFromURL(url)
    
    PackageConfig = ConfigParser.ConfigParser()
    PackageConfig.readfp(settings)
    
    for section in PackageConfig.sections():
        section = ConfigSectionMap(PackageConfig, section)
        
        # print section
        print "Downloading %s..." % section['description']
        
        downloadPkg(section['url'], url, section['md5'], TempPath)
        
        print ""
    
    return True

def settingsFromURL(url):
    response = urllib2.urlopen(url)
    return StringIO.StringIO(response.read())
    
def downloadPkg(pkgPath, settingsUrl, md5, path):
    pkgUrl = downloadUrlFromUrls(pkgPath, settingsUrl)
    localPath = fullPath(path, fileName(pkgPath))
    
    # Download the package
    urllib.urlretrieve(pkgUrl, fullPath(path, fileName(pkgPath)))
    
    md5Pkg(localPath, md5)
    installPkg(localPath)
    
    return True

def downloadUrlFromUrls(pkgPath, settingsUrl):
    return "{0}/{1}".format(rootPath(settingsUrl), pkgPath)

def rootPath(url):
    return ("/").join(url.split("/")[0:-1])

def fileName(url):
    return (url.split("/")[-1])
    
def fullPath(path, filename):
    return "{0}/{1}".format(path, filename)
    
def md5Pkg(pkgPath, md5):
    pkgMD5 = hashlib.md5(open(pkgPath, 'rb').read()).hexdigest()

    if md5 == pkgMD5:
        print "{0} matches the md5({1})".format(pkgPath, md5)
        return pkgPath
    else:
        os.remove(pkgPath)
        print "{0} does not match the md5({1}) EXITING".format(pkgPath, md5)
        exit(1)

def installPkg(pkgPath):
    target = "/"
    
    cmd = "/usr/sbin/installer -package {0} -target {1}".format(pkgPath, target)
    
    return_code = subprocess.call(cmd, shell=True) 
    return return_code

def iniLocations():
    array = []
    for location in ConfigSectionMap(AppConfig, "settings").values():
        array.append(location)
    return array

if EUID != 0:
    print "Script must be run as root"
    exit(1)
else:
    AppConfig.read(settingsFilePath())

    print "Installing packages for Unity"

    downloadAndInstallFromSettingsURL(iniLocations()[0])

    print "Done installing packages for Unity"
    exit(0)