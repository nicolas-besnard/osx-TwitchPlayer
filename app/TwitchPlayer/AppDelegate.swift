//
//  AppDelegate.swift
//  TwitchPlayer
//
//  Created by Nicolas Besnard on 23/02/2015.
//  Copyright (c) 2015 Nicolas Besnard. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    var statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(CGFloat(-1))
    
    var menu = NSMenu()

    func applicationDidFinishLaunching(aNotification: NSNotification) {       
        var imageName = "twitchIconLight"
        
        if isInDarkMode() {
            imageName = "twitchIconDark"
        }
        
        statusItem.image = NSImage(named: imageName)
        statusItem.alternateImage = NSImage(named: imageName)
        statusItem.title = ""
        statusItem.menu = menu
        
        var menuItem = NSMenuItem()
        menuItem.title = "Configuration"
        menuItem.action = Selector("clickItemConfiguration")
        menuItem.keyEquivalent = ""
        
        var menuItemQuit = NSMenuItem()
        menuItemQuit.title = "Quit"
        menuItemQuit.action = Selector("clickItemQuit")
        
        menu.addItem(menuItem)
        menu.addItem(menuItemQuit)
        
        self.window!.orderOut(self)
    }
    
    func clickItemConfiguration() {
         NSApp.activateIgnoringOtherApps(true)
        self.window.orderFront(self)
    }
    
    func clickItemQuit() {
        NSApplication.sharedApplication().terminate(self)
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    private func isInDarkMode() -> Bool {
        let mode = NSUserDefaults.standardUserDefaults().stringForKey("AppleInterfaceStyle") ?? "Light"
        return mode == "Dark"
    }

}

