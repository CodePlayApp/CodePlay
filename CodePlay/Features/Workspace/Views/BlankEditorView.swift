//
//  Workspace.swift
//  CodePlay
//
//  Created by Mustafa Malik on 27/06/2024.
//

import SwiftUI

struct BlankEditorView: View {
    
    @State private var indexingProject: Bool = true
    
    @EnvironmentObject var openProjectUrl: MenuModel
    
    var body: some View {
        VStack {
            if self.indexingProject {
//                ProgressView()
//                    .progressViewStyle(.circular)
                Text(openProjectUrl.projectUrl?.absoluteString ?? "None")
            } else {
                
            }
        }
        .frame(minWidth: 900, minHeight: 500)
    }
}

#Preview {
    BlankEditorView()
}
