//
//  Window.swift
//  CodePlay
//
//  Created by Mustafa Malik on 26/06/2024.
//

import SwiftUI

class Window {
    
    public var nsWindow: NSWindow
    private var contentView: NSView // NSHostingView
    private var closeWhenDestroyed: Bool
    
    public var title: String
    public var styleMasks: NSWindow.StyleMask = [.closable, .titled]
    
    public init(title: String = "", closeWhenDone: Bool, view: NSView) {
        self.nsWindow = NSWindow()
        self.closeWhenDestroyed = closeWhenDone
        self.title = title
        self.contentView = view
    }
    
    deinit {
        if self.closeWhenDestroyed {
            self.nsWindow.close()
        }
    }
    
    public func makeWindow(shouldCenter: Bool, hideTitleBar: Bool) {
        nsWindow.styleMask = self.styleMasks
        nsWindow.title = self.title
        nsWindow.contentView = self.contentView
        
        if shouldCenter {
            nsWindow.center()
        }
        
        if hideTitleBar {
            nsWindow.titlebarAppearsTransparent = true
        }
    }
}
