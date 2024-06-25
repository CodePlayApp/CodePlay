//
//  CodePlayApp.swift
//  CodePlay
//
//  Created by Mustafa Malik on 25/06/2024.
//

import SwiftUI

class CodePlayDelegator : NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ notification: Notification) -> Void {
        if let window = NSApp.windows.first {
            window.standardWindowButton(.zoomButton)?.isHidden = true
            window.standardWindowButton(.miniaturizeButton)?.isHidden = true
            
            window.setContentSize(NSSize(width: 720, height: 430))
            window.center()
            window.setFrameOrigin(NSPoint(x: window.frame.origin.x, y: window.frame.origin.y - 50))
        }
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }
    
}

@main
struct CodePlayApp: App {
    
    @NSApplicationDelegateAdaptor(CodePlayDelegator.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MenuScene()
        }
        .windowResizability(.contentSize)
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
