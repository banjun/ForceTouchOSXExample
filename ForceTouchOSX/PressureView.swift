//
//  PressureView.swift
//  ForceTouchOSX
//
//  Created by BAN Jun on 6/8/15.
//  Copyright (c) 2015 banjun. All rights reserved.
//

import Cocoa


class PressureView: NSView {
    var point = NSZeroPoint
    var pressure = Float(0)
    var stage = Int(0)
    
    init() {
        super.init(frame: NSZeroRect)
        
        wantsLayer = true
        layer?.backgroundColor = NSColor.whiteColor().CGColor
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func pressureChangeWithEvent(event: NSEvent!) {
        point = convertPoint(event.locationInWindow, fromView: nil)
        pressure = event.pressure
        stage = event.stage
        NSLog("%@", "event = \(event)")
        setNeedsDisplayInRect(bounds)
    }
    
    override func drawRect(dirtyRect: NSRect) {
        let radius = 100 * CGFloat(pressure)
        let path = NSBezierPath(ovalInRect: NSInsetRect(NSMakeRect(point.x, point.y, 0, 0), radius, radius))
        
        switch stage {
        case 1: NSColor.redColor().set()
        case 2: NSColor.greenColor().set()
        default: NSColor.blackColor().set()
        }
        
        path.lineWidth = 5
        path.stroke()
    }
}