//
//  Workspace.swift
//  CodePlay
//
//  Created by Mustafa Malik on 27/06/2024.
//

import SwiftUI

struct ProjectTopLevelView: View {
    
    @State public var projectName: String
    @State public var gitBranch: String
    
    var body: some View {
        HStack {
            
        }
        .frame(maxWidth: .infinity, maxHeight: 10)
        .background(.gray.opacity(0.3))
    }
    
}

struct BlankEditorView: View {
    
    @State private var indexingProject: Bool = true
    @State private var showInspector: Bool = false
    
    @EnvironmentObject var openProjectUrl: MenuModel
    
    private var topSectionContextMenu: [String] = [
        "Open in Tab",
        "Open in New Window",
        "Open As"
    ]
    
    private var middleSectionContextMenu: [String] = [
        "New File...",
        "New Java Dependency",
        "Add Files to Project",
        "Add File to CMakeLists.txt",
        "Add Swift Package Dependencies",
    ]
    
    private var nextSectionContextMenu: [String] = [
        "New Group",
        "New Group from Selection",
        "New Group without Folder"
    ]
    
    var body: some View {
        NavigationSplitView(sidebar: {
            // Top Lines Under Window Buttons
            VStack {
                Spacer()
                    .frame(height: 10)
                Divider()
                    .frame(maxWidth: .infinity)
                HStack(spacing: 10) {
                    Button {
                        
                    } label: {
                        Image(systemName: "folder")
                            .foregroundStyle(.tint)
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button {
                        
                    } label: {
                        Image(systemName: "square.split.diagonal.2x2")
                    }
                    .buttonStyle(PlainButtonStyle())
                    Button {
                        
                    } label: {
                        Image(systemName: "bookmark")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding([.top, .bottom], 0.1)
                Divider()
                    .frame(maxWidth: .infinity)
            }
            // End Top Lines Under Window Buttons
            List {
                NavigationLink(destination: {
                    VStack {
                        ProjectTopLevelView(projectName: "", gitBranch: "")
                        Spacer()
                        ProgressView()
                            .progressViewStyle(.circular)
                        Spacer()
                    }
                }, label: {
                    Text("Test Button")
                })
            }
            .contextMenu(ContextMenu(menuItems: {
                Text("Show in Finder")
                Divider()
                ForEach(self.topSectionContextMenu, id: \.self) { menuOption in
                    Text(menuOption)
                }
                Divider()
                Text("Show File Inspector")
                Divider()
                ForEach(self.middleSectionContextMenu, id: \.self) { menuOption in
                    Text(menuOption)
                }
                Divider()
                Text("Delete")
                Divider()
                ForEach(self.nextSectionContextMenu, id: \.self) { menuOption in
                    Text(menuOption)
                }
            }))
        }, detail: {
            VStack {
                ProjectTopLevelView(projectName: "", gitBranch: "")
                Spacer()
            }
        })
        .navigationTitle("Project")
        .toolbarBackground(.visible, for: .windowToolbar)
        .frame(minWidth: 900, minHeight: 500)
        .inspector(isPresented: self.$showInspector) {
            VStack {
                
            }
            .inspectorColumnWidth(min: 250, ideal: 300, max: 500)
            .toolbar {
                Spacer()
                Button {
                    self.showInspector.toggle()
                } label: {
                    Label("Toggle Code Inspector", systemImage: "sidebar.trailing")
                }
            }
//            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .onAppear {
                if NSApp.findWindow(.MenuWindow) != nil {
                    guard let currentWindow = NSApp.findWindow(.BlankEditorWindow) else {
                        return
                    }
                    currentWindow.close()
                }
            }
//            .visualEffect(material: .fullScreenUI, blendingMode: .behindWindow)
        }
        //.background(.thinMaterial)
    }
}
