//
//  CodePlayApp.swift
//  CodePlay
//
//  Created by Mustafa Malik on 25/06/2024.
//

import SwiftUI

class CodePlayDelegator : NSObject, NSApplicationDelegate {
    
    private var aboutInfoWindowController: NSWindowController?
    private var blankEditorWindowController: NSWindowController?
    
    private let requiredMasks: NSWindow.StyleMask = [.titled, .closable, .fullSizeContentView]
    
    func showAppInfoView() -> Void {
        if self.aboutInfoWindowController == nil {
            let window = Window(closeWhenDone: true, view: NSHostingView(rootView: AppInfo()))
            
            window.styleMasks = self.requiredMasks
            window.makeWindow(shouldCenter: true, hideTitleBar: true)
            
            self.aboutInfoWindowController = NSWindowController(window: window.nsWindow)
        }        
        self.aboutInfoWindowController?.showWindow(self.aboutInfoWindowController?.window)
    }
    
    func showBlankEditorView(fileUrl: String?) -> Void {
        if self.blankEditorWindowController == nil {
            let window = Window(closeWhenDone: true, view: NSHostingView(rootView: BlankEditorView(projectFileUrl: fileUrl)))
            
            window.styleMasks = self.requiredMasks
            window.makeWindow(shouldCenter: true, hideTitleBar: true)
            
            self.blankEditorWindowController = NSWindowController(window: window.nsWindow)
        }
        self.blankEditorWindowController?.showWindow(self.blankEditorWindowController?.window)
    }
    
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
    
    @NSApplicationDelegateAdaptor(CodePlayDelegator.self) static var appDelegate
    
    var body: some Scene {
        WindowGroup {
            MenuScene()
        }
        .windowResizability(.contentSize)
        .windowStyle(HiddenTitleBarWindowStyle())
        .commands(content: {
            CommandGroup(replacing: .appInfo, addition: {
                Button(action: {
                    Self.appDelegate.showAppInfoView()
                }, label: {
                    Text("About CodePlay")
                })
            })
        })
    }
}
