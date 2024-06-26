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
                        }
                        Spacer()
                            .frame(width: ((720 / 4) / 2))
                    }
                }
                .frame(maxWidth: 720 / 2, maxHeight: .infinity, alignment: .center)
                VStack {
                    
                }
                .frame(maxWidth: 720 / 4, maxHeight: .infinity)
                .border(width: 1.0, edges: [.leading], color: colorScheme == .dark ? .white.opacity(0.3) : Color(nsColor: .systemGray.withAlphaComponent(0.3)))
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
