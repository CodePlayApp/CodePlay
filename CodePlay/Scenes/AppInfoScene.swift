//
//  AppInfoScene.swift
//  CodePlay
//
//  Created by Mustafa Malik on 27/06/2024.
//

import SwiftUI

struct AppInfoScene: Scene {
    
    var body: some Scene {
        Window("AppInfo", id: SceneID.AppInfoWindow.rawValue) {
            AppInfo()
        }
        .windowResizability(.contentSize)
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}
