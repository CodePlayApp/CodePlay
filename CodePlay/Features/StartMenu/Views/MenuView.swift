//
//  ContentView.swift
//  CodePlay
//
//  Created by Mustafa Malik on 25/06/2024.
//

import SwiftUI

// IDEA: Be able to design and build mock up UI of macOS/iOS Apps
// Be able to view the code for it too

struct MenuView: View {
    
    private let width: CGFloat = 740
    private let height: CGFloat = 433
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @Environment(\.openWindow) var openWindow: OpenWindowAction
    @Environment(\.dismiss) var dismiss: DismissAction
    
    @EnvironmentObject var openProjectUrl: MenuModel
    
    @State private var showNewProject: Bool = false
    @State private var openProject: Bool = false
    
    var body: some View {
        HStack(spacing: 0) {
            // Left Panel
            VStack {
                ZStack {
                    Image(nsImage: NSImage(named: "AppIcon")!)
                        .blur(radius: 20)
                    Image(nsImage: NSImage(named: "AppIcon")!)
                }
                
                Spacer()
                    .frame(height: 10)
                
                Text("CodePlay")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Version \(VersionBundle.appVersion)")
                
                Spacer()
                    .frame(height: 30)

                Button(action: { self.showNewProject.toggle() }, label: {
                    HStack {
                        Image(systemName: "plus.square")
                        Text("New Project")
                    }
                    .frame(width: 300, alignment: .leading)
                })
                .buttonStyle(MenuButtonStyle())

                Button(action: { self.openProject.toggle() }, label: {
                    HStack {
                        Image(systemName: "folder")
                        Text("Open Project")
                    }
                    .frame(width: 300, alignment: .leading)
                })
                .buttonStyle(MenuButtonStyle())
            }
            .frame(width: (width / 2) + (width / 6), height: height)
            // Right Panel
            VStack {
                Text("Not Implemented")
                    .foregroundStyle(.white)
            }
            .frame(width: width / 3, height: height)
            .background(VisualEffectBackground(material: .fullScreenUI, blendingMode: .behindWindow, emphasized: true)
                .edgesIgnoringSafeArea(.all))
        }
        .frame(width: width, height: height)
        .fixedSize()
        .presentedWindowStyle(.hiddenTitleBar)
        .sheet(isPresented: self.$showNewProject) {
            VStack {
                
            }
            .frame(width: 300, height: 300)
        }
        .fileImporter(isPresented: self.$openProject, allowedContentTypes: [.folder]) { result in
            if let url = try? result.get() {
                openProjectUrl.projectUrl = url
                NSApp.closeWindow(SceneID.MenuWindow)
                openWindow(id: SceneID.BlankEditorWindow.rawValue)
            }
        }
    }
    
}

