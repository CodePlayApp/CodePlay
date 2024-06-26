//
//  ContentView.swift
//  CodePlay
//
//  Created by Mustafa Malik on 25/06/2024.
//

import SwiftUI

// IDEA: Be able to design and build mock up UI of macOS/iOS Apps
// Be able to view the code for it too

struct MenuScene: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var viewWindow: NSWindow? = nil
    @State private var showNewProject: Bool = false
    @State private var openProject: Bool = false

    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                VStack {
                    HStack {
                        VStack {
                            ZStack {
                                Image(nsImage: NSImage(named: "AppIcon")!)
                                    .blur(radius: 20)
                                Image(nsImage: NSImage(named: "AppIcon")!)
                            }
                            
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
                        Spacer()
                            .frame(width: ((720 / 4) / 2))
                    }
                }
                .frame(maxWidth: 720 / 2, maxHeight: .infinity, alignment: .center)
                VStack {
                    HStack {
                        Spacer()
                            .frame(width: (720 / 4) / 2)
                        VStack {
                            Text("TODO")
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(maxWidth: 720 / 4, maxHeight: .infinity, alignment: .center)
                .border(width: 1.0, edges: [.leading], color: colorScheme == .dark ? .white.opacity(0.3) : Color(nsColor: .systemGray.withAlphaComponent(0.3)))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .visualEffect(material: .fullScreenUI, blendingMode: .behindWindow)
        .ignoresSafeArea()
        .frame(width: 720, height: 430)
        .fixedSize()
        .background(WindowAccessor(currentWindow: self.$viewWindow))
        .sheet(isPresented: self.$showNewProject) {
            VStack {
                
            }
            .frame(width: 720 / 2, height: 720 / 2)
        }
        .fileImporter(isPresented: self.$openProject, allowedContentTypes: [.folder]) { result in
            if let url = try? result.get() {
                CodePlayApp.appDelegate.showBlankEditorView(fileUrl: url.absoluteString)
                self.viewWindow!.close()
            }
        }
    }
}

//#Preview {
//    MenuScene()
//}
