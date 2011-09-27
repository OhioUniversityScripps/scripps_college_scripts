#
#  rb_main.rb
#  Footprints Statusbar
#
#  Created by Ricky Chilcott on 9/19/11.
#  Copyright (c) 2011 Ohio University. All rights reserved.
#

framework 'Cocoa'
framework 'foundation'

# Loading all the Ruby project files.
main = File.basename(__FILE__, File.extname(__FILE__))
dir_path = NSBundle.mainBundle.resourcePath.fileSystemRepresentation
Dir.glob(File.join(dir_path, '*.{rb,rbo}')).map { |x| File.basename(x, File.extname(x)) }.uniq.each do |path|
  if path != main
    require(path)
  end
end

#
#   
#
def setupMenu
    menu = NSMenu.new
    menu.initWithTitle 'OIT Help'
    
    
    mi = NSMenuItem.new
    mi.title = 'Search the Knowledge Base'
    mi.action = 'searchKnowledgeBase:'
    mi.setToolTip 'Find answers to common questions'
    mi.target = self
    menu.addItem mi
    
    mi = NSMenuItem.new
    mi.title = 'Submit a Ticket'
    mi.action = 'submitTicket:'
    mi.setToolTip 'Submit a help ticket'
    mi.target = self
    menu.addItem mi
    
    mi = NSMenuItem.separatorItem
    menu.addItem mi
    
    mi = NSMenuItem.new
    mi.title = 'Quit'
    mi.action = 'quit:'
    mi.target = self
    menu.addItem mi
    
    menu
end

# Init the status bar
def initStatusBar(menu)
    status_bar = NSStatusBar.systemStatusBar
    status_item = status_bar.statusItemWithLength(NSVariableStatusItemLength)
    status_item.setMenu menu
    status_item.setToolTip 'Having a problem?'
    status_item.setHighlightMode true
    # status_item.title = "Help!"
    img = NSImage.new.initWithContentsOfFile NSBundle.mainBundle.pathForResource('help.png', ofType:nil)
    status_item.setImage(img)
end

def helpOnClick(sender)
    
end

#
# Menu Item Actions
#
def submitTicket(sender)
    `open https://support.oit.ohio.edu/`
end

def searchKnowledgeBase(sender)
    `open http://www.ohio.edu/oitech`
end

def quit(sender)
    app = NSApplication.sharedApplication
    app.terminate(self)
end

# Rock'n Roll
app = NSApplication.sharedApplication

# Create the status bar item, add the menu and set the image
initStatusBar(setupMenu)
app.run

# Starting the Cocoa main loop.
NSApplicationMain(0, nil)
