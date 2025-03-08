//
//  ButtonView.swift
//  BombGame
//
//  Created by Варвара Уткина on 12.02.2025.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            RoundedRectangle(cornerRadius: 10)
                .fill(Colors.ComponentsColors.gameViewButton)
                .frame(height: 55)
                .shadow(radius: 2)
                .overlay {
                    Text(title)
                        .font(Font.customFont(size: 20).weight(.bold))
                        .foregroundStyle(Colors.TextColors.primary)
                }
        }
    }
}

#Preview {
    ButtonView(title: "Запустить", action: {})
}
