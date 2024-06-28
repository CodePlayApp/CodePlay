//
//  MenuModel.swift
//  CodePlay
//
//  Created by Mustafa Malik on 27/06/2024.
//

import Foundation

// TODO: Add it to the required views
class MenuModel: ObservableObject {
    
    @Published var projectUrl: URL? = nil
    
    public func updateURL(from: URL) -> Void {
        projectUrl = from
    }
    
}
