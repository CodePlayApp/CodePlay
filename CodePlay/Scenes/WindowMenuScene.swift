//
//  WindowMenuScene.swift
//  CodePlay
//
//  Created by Mustafa Malik on 27/06/2024.
//

import SwiftUI

struct WindowMenuScene: Scene {
    
    @Environment(\.openWindow) var openWindow: OpenWindowAction
    
    var body: some Scene {
        Window("Window Menu", id: SceneID.MenuWindow.rawValue) {
            MenuView()
                .task {
                    if let window = NSApp.findWindow(.MenuWindow) {
                        window.isMovableByWindowBackground = true
                        window.styleMask = [.titled, .closable, .fullSizeContentView]
                    }
                }
        }
        .windowStyle(HiddenTitleBarWindowStyle())
        .windowResizability(.contentSize)
        .commands(content: {
            CommandGroup(replacing: .appInfo, addition: {
                Button(action: {
                    openWindow(id: SceneID.AppInfoWindow.rawValue)
                }, label: {
                    Text("About CodePlay")
                })
            })
        })
    }
}
