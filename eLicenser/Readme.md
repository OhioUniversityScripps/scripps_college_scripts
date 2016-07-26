# How to rebuild this package


Find the latest licenser at http://www.steinberg.net/en/company/technologies/elicenser.html

Download, install, and review the following paths in a VM

* /Applications/License Control Center.app
* /Applications/Application Support/eLicenser
* /Applications/Application Support/Syncrosoft*

Copy files as appropriate, bump version number in `build-info.json` and build package


# Why is this needed?

In the Nuendo installers, the eLicenser package tries to launch, but it doesn't install appropriately because it's looking for a window to connect to. As such, we need to relicense.