# Scripps College Hello IT

This app was created using HelloIT Project (https://github.com/ygini/Hello-IT). The project page provides complete details about manipulating the plist config file. To create a pkg, munkipkg was used (https://github.com/munki/munki-pkg). By looking at the payload folder, you can see where each file needs to be placed on the targte disk.


To build or update the package, issues the followin command

	/path/to/munkipkg --export-bom-info /path/to/scrippscollege_scripts_repo/edu.ohio.scrippscollege.HelloIT