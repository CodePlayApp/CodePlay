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

    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                VStack {
                    Text("CodePlay")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Text("Version \(VersionBundle.appVersion)")
                }
                .frame(maxWidth: 720 / 2, maxHeight: .infinity)
                VStack {
                    
                }
                .frame(maxWidth: 720 / 2, maxHeight: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .visualEffect(material: .fullScreenUI, blendingMode: .behindWindow)
        .ignoresSafeArea()
        .frame(width: 720, height: 430)
        .fixedSize()
    }
}

#Preview {
    MenuScene()
}
