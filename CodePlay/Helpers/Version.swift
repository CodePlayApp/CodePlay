//
//  Version.swift
//  CodePlay
//
//  Created by Mustafa Malik on 26/06/2024.
//

import Foundation

struct VersionBundle {

    public static let appVersion: String = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown"
    
}
