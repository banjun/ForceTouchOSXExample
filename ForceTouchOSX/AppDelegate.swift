//
//  AppDelegate.swift
//  ForceTouchOSX
//
//  Created by BAN Jun on 6/8/15.
//  Copyright (c) 2015 banjun. All rights reserved.
//

import Cocoa
import NorthLayout

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var window: NSWindow!
     
    let button = NSButton(frame: NSZeroRect)
    let label = NSTextField(frame: NSZeroRect)
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let contentView = window.contentView as! NSView
        button.bezelStyle = .ThickSquareBezelStyle
        button.title = "Feel the Force"
        button.setButtonType(NSButtonType.MultiLevelAcceleratorButton)
        button.maxAcceleratorLevel = 5
        button.target = self
        button.action = "clicked:"
        
        label.font = NSFont.systemFontOfSize(36)
        label.textColor = NSColor.blackColor()
        label.drawsBackground = false
        label.bordered = false
        label.bezeled = false
        label.selectable = false
        label.editable = false
        label.alignment = .CenterTextAlignment
        
        let autolayout = contentView.northLayoutFormat([:], ["button": button, "label": label])
        autolayout("H:|-[button]-|")
        autolayout("H:|-[label]-|")
        autolayout("V:|-[button]-[label]")
    }
    
    @objc private func clicked(sender: AnyObject?) {
        let level = button.integerValue
        let percentage = Float(level) / Float(button.maxAcceleratorLevel)
        
        label.stringValue = "level = \(level), \(percentage * 100) %"
        label.font = NSFont.systemFontOfSize(CGFloat(24 + 24 * percentage))
    }
}

