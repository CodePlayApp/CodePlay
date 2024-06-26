//
//  Window.swift
//  CodePlay
//
//  Created by Mustafa Malik on 26/06/2024.
//

import SwiftUI

class Window : NSObject, NSWindowDelegate {
    
    private static var windowRef: NSWindow? = nil
    public static var nsWindow: NSWindow? {
        get {
            return windowRef
        }
    }
    
    public static func createWindow(width: CGFloat, height: CGFloat, styleMasks: NSWindow.StyleMask, parent: NSScreen?, hostView: some View) -> Void {
        let window = NSWindow(contentRect: NSMakeRect(0, 0, width, height), styleMask: [], backing: .buffered, defer: false, screen: parent)
        
        window.contentViewController = NSHostingController(rootView: hostView)
        window.styleMask = styleMasks
        window.hasShadow = true
        window.center()
        window.makeKeyAndOrderFront(nil)
        
        Self.windowRef = window
    }
    
    public static func closeWindow() -> Void {
        if let window = Self.windowRef {
            window.close()
            Self.windowRef = nil
        }
    }
    
    func windowShouldClose(_ sender: NSWindow) -> Bool {
        if sender == Self.windowRef {
            Self.closeWindow()
            return true
        }
        return false
    }
}
