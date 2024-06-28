//
//  AppInfo.swift
//  CodePlay
//
//  Created by Mustafa Malik on 26/06/2024.
//

import SwiftUI

struct AppInfo: View {
    
    var body: some View {
        HStack {
            Image(nsImage: NSImage(named: "AppIcon")!)
            Spacer()
                .frame(width: 30)
            VStack {
                Spacer()
                Text("CodePlay")
                    .font(.title)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Version \(VersionBundle.appVersion)")
                    .font(.subheadline)
                    .padding([.bottom])
                    .foregroundStyle(.gray)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Copyright (c) 2024 CodePlay and Authors. See GNU\nGPLv3 license for more information. To Contact for more information, please reach out via 140mustafa@gmail.com.")
                    .font(.callout)
                    .foregroundStyle(.gray)
                Spacer()
                    .frame(height: 60)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .frame(width: 500, height: 180)
        .fixedSize()
        .presentedWindowStyle(.hiddenTitleBar)
        .onAppear {
            Task {
                if let window = NSApp.findWindow(.AppInfoWindow) {
                    window.standardWindowButton(.miniaturizeButton)?.isHidden = true
                    window.standardWindowButton(.zoomButton)?.isHidden = true
                }
            }
        }
    }
}
