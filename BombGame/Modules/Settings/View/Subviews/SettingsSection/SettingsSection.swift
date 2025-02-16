//
//  SettingsSection.swift
//  BombGame
//
//  Created by nikita on 15.02.25.
//

import SwiftUI

struct SettingsSection<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
        .frame(maxWidth: .infinity)
        .background(Color.categoryCellBg)
    
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.primaryText, lineWidth: 1)
        )
        .padding(.horizontal, 18)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)

    }
}

#Preview {
    SettingsSection {
        Text("Привет!")
    }
}
