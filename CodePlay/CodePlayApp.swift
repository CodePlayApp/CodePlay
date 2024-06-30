//
//  CodePlayApp.swift
//  CodePlay
//
//  Created by Mustafa Malik on 25/06/2024.
//

import SwiftUI

class CodePlayDelegator : NSObject, NSApplicationDelegate {
    
    func applicationWillUpdate(_ notification: Notification) {

    }
    
    func applicationDidFinishLaunching(_ notification: Notification) -> Void {
        UserDefaults.standard.register(defaults: ["NSQuitAlwaysKeepsWindows" : false])
        
        if let window = NSApp.windows.first {
            window.standardWindowButton(.zoomButton)?.isHidden = true
            window.standardWindowButton(.miniaturizeButton)?.isHidden = true
            
            window.setContentSize(NSSize(width: 720, height: 430))
            window.center()
            window.setFrameOrigin(NSPoint(x: window.frame.origin.x, y: window.frame.origin.y - 50))
        }
        
        DispatchQueue.main.async {
            if let menu = NSApplication.shared.mainMenu {
                guard let fileItem = menu.item(withTitle: "File") else {
                    return
                }
                guard let editItem = menu.item(withTitle: "Edit") else {
                    return
                }
                guard let windowItem = menu.item(withTitle: "Window") else {
                    return
                }
                guard let viewItem = menu.item(withTitle: "View") else {
                    return
                }
                menu.removeItem(fileItem)
                menu.removeItem(editItem)
                menu.removeItem(windowItem)
                menu.removeItem(viewItem)
            }
        }
    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return true
    }

}

@main
struct CodePlayApp: App {
    
    @NSApplicationDelegateAdaptor(CodePlayDelegator.self) var appDelegate
    @Environment(\.openWindow) var openWindow: OpenWindowAction
    @StateObject var openProjectUrl: MenuModel = MenuModel()
    
    var body: some Scene {
        Group {
            WindowMenuScene()
            AppInfoScene()
            BlankEditorScene()
        }
        .environmentObject(openProjectUrl)
    }
}

