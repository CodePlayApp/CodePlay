//
//  BlankEditorScene.swift
//  CodePlay
//
//  Created by Mustafa Malik on 27/06/2024.
//

import SwiftUI

struct BlankEditorScene: Scene {
    
    var body: some Scene {
        Window("BlankEditorView", id: SceneID.BlankEditorWindow.rawValue) {
            BlankEditorView()
        }
        .windowResizability(.contentMinSize)
        .windowStyle(HiddenTitleBarWindowStyle())
    }
    
}
