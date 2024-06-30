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
    
    @State private var projectOptions: [String] = [
        "Empty Project",
        "GUI Builder Project",
        "C/C++ Project",
        "Swift Project",
        "Java Project"
    ]
    @State private var selectedProject: String = ""
    
    @State private var projectName: String = ""
    @State private var packageName: String = ""
    
    @State private var browseFileUrl: String = "No Location"
    @State private var shouldBrowseFile: Bool = false
    
    init() {
        _selectedProject = State(initialValue: projectOptions.first ?? "Empty Project")
    }
    
    // TODO: Make it actually do shit
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
            VStack(spacing: 0) {
                Form {
                    Group {
                        Section("Choose options for your new project:") {
                            HStack {
                                Text("Project Name: ")
                                    .frame(width: 120, alignment: .leading)
                                TextField(text: self.$projectName, label: { EmptyView() })
                                    .multilineTextAlignment(.leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(maxWidth: .infinity)
                                    .focusEffectDisabled()
                            }
                            HStack {
                                Text("Project Package: ")
                                    .frame(width: 120, alignment: .leading)
                                TextField(text: self.$packageName, label: { EmptyView() })
                                    .multilineTextAlignment(.leading)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .frame(maxWidth: .infinity)
                                    .focusEffectDisabled()
    //                                .overlay(
    //                                    RoundedRectangle(cornerRadius: 5.0)
    //                                        .stroke(.gray.opacity(0.4), lineWidth: 0.4)
    //                                )
                            }
                        }
                        Section("Select configurations for your project:") {
                            HStack {
                                Text(self.browseFileUrl)
                                Spacer()
                                Button(action: { self.shouldBrowseFile.toggle() }, label: {
                                    Text("Browse")
                                })
                            }
                            HStack {
                                Text("Select Project Type")
                                Spacer()
                                Picker("", selection: self.$selectedProject) {
                                    ForEach(self.projectOptions, id: \.self) { projectName in
                                        Text(projectName)
                                            .tag(projectName)
                                    }
                                }
                            }
                        }
                        .fileImporter(isPresented: self.$shouldBrowseFile, allowedContentTypes: [.folder]) { result in
                            print(self.selectedProject)
                            if let url = try? result.get() {
                                self.browseFileUrl = url.absoluteString
                            }
                        }
                    }
                }
                .formStyle(.grouped)
                .frame(width: width - 50, height: height - 50)
                HStack {
                    Spacer()
                    Button(action: { self.showNewProject = false }, label: { Text("Cancel") })
                    Button(action: { }, label: {
                        Text("Create")
                    })
                    .keyboardShortcut(.defaultAction)
                }
                .padding()
            }
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

