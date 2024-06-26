//
//  MenuButton.swift
//  CodePlay
//
//  Created by Mustafa Malik on 26/06/2024.
//

import SwiftUI

struct MenuButtonStyle: ButtonStyle {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var backgroundColor: Color? = nil
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(self.backgroundColor ?? .gray)
            .foregroundStyle(colorScheme == .light ? .black.opacity(0.8) : .white)
            .cornerRadius(10)
            .onAppear {
                self.backgroundColor = colorScheme == .dark ? .white.opacity(0.3) : Color(nsColor: .systemGray.withAlphaComponent(0.3))
            }
            .onHover(perform: { hovering in
                if hovering {
                    self.backgroundColor = colorScheme == .dark ? .white.opacity(0.5) : Color(nsColor: .systemGray.withAlphaComponent(0.5))
                } else {
                    self.backgroundColor = colorScheme == .dark ? .white.opacity(0.3) : Color(nsColor: .systemGray.withAlphaComponent(0.3))
                }
            })
    }
}

struct MenuButton: View {
    var body: some View {
        ZStack {
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("Button")
            })
            .buttonStyle(MenuButtonStyle())
        }
        .padding()
    }
}

#Preview {
    MenuButton()
}
