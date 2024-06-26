//
//  WindowAccessor.swift
//  CodePlay
//
//  Created by Mustafa Malik on 27/06/2024.
//

import SwiftUI

struct WindowAccessor: NSViewRepresentable {
    @Binding var currentWindow: NSWindow?
    
    func makeNSView(context: Context) -> some NSView {
        let view = NSView()
        DispatchQueue.main.async {
            self.currentWindow = view.window
        }
        return view
    }
    
    func updateNSView(_ nsView: NSViewType, context: Context) { }
}
