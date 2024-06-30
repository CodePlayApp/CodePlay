////
////  Workspace.swift
////  CodePlay
////
////  Created by Mustafa Malik on 27/06/2024.
////
//
//import SwiftUI
//
//extension CGSize {
//    init(point: CGPoint) {
//        self.init(width: point.x, height: point.y)
//    }
//}
//
//struct BlankEditorView: View {
//    
//    @State private var indexingProject: Bool = true
//    @State private var showInspector: Bool = true
//    
//    @EnvironmentObject var openProjectUrl: MenuModel
//    
//    @State private var isDragging: Bool = false
//    @State private var sampleOffset: CGSize = CGSize.zero
//    @State private var initialOffset: CGSize = CGSize.zero
//    
//    @State private var sampleLabel: Text = Text("Sample Text Label")
//    
//    var body: some View {
//        NavigationSplitView(sidebar: {
//            List {
//                NavigationLink(destination: {
//                    ProgressView()
//                        .progressViewStyle(.circular)
//                }, label: {
//                    Text("Test Button")
//                })
//            }
//        }, detail: {
//            VStack {
//                if self.indexingProject {
//                    Text(openProjectUrl.projectUrl?.absoluteString ?? "None")
//                } else {
//                    
//                }
//            }
//        })
//        .navigationTitle("Project")
//        .toolbarBackground(.visible, for: .windowToolbar)
//        .frame(minWidth: 900, minHeight: 500)
//        .inspector(isPresented: self.$showInspector) {
//            VStack {
//                sampleLabel
//                    .foregroundStyle(.white)
//                    .background(.red)
//                    .cornerRadius(5.0)
//                    .offset(sampleOffset)
//                    .gesture(
//                        DragGesture()
//                            .onChanged { gesture in
//                                 self.isDragging = true
//                                 self.sampleOffset = CGSize(
//                                     width: self.initialOffset.width + gesture.translation.width,
//                                     height: self.initialOffset.height + gesture.translation.height
//                                 )
//                             }
//                             .onEnded { gesture in
//                                 self.sampleOffset = CGSize(
//                                     width: self.initialOffset.width + gesture.translation.width,
//                                     height: self.initialOffset.height + gesture.translation.height
//                                 )
//                                 self.initialOffset = self.sampleOffset
//                                 self.isDragging = false
//                             }
//                    )
//            }
//            .inspectorColumnWidth(min: 250, ideal: 300, max: 500)
//            .onAppear {
//                NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
//                    if self.isDragging {
//                        //self.sampleOffset = CGSize(point: NSEvent.mouseLocation)
//                    }
//                    return $0
//                }
//            }
//            .toolbar {
//                Spacer()
//                Button {
//                    self.showInspector.toggle()
//                } label: {
//                    Label("Toggle Code Inspector", systemImage: "sidebar.trailing")
//                }
//            }
////            .ignoresSafeArea()
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
////            .visualEffect(material: .fullScreenUI, blendingMode: .behindWindow)
//        }
//        //.background(.thinMaterial)
//    }
//}
//
