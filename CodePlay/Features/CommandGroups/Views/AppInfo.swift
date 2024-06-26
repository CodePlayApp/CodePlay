//
//  AppInfo.swift
//  CodePlay
//
//  Created by Mustafa Malik on 26/06/2024.
//

import SwiftUI

struct AppInfo: View {
    var body: some View {
        VStack {
            Spacer()
            Image(nsImage: NSImage(named: "AppIcon")!)
            Text("About CodePlay")
                .font(.largeTitle)
            Text("Version \(VersionBundle.appVersion)")
                .font(.subheadline)
                .padding([.bottom])
            Text("Developed by Mustafa Malik")
                .font(.callout)
            Spacer()
            .padding()
        }
        .frame(width: 300, height: 300)
        .fixedSize()
        .presentedWindowStyle(.hiddenTitleBar)
    }
}
