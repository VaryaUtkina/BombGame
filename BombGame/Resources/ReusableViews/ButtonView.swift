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
        VStack {
            Button {
                action()
            } label: {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Colors.ComponentsColors.gameViewButton)
                    .frame(width: .infinity, height: 55)
                    .shadow(radius: 2)
                    .overlay {
                        Text(title)
                            .font(Font.customFont(size: 20).weight(.bold))
                            .foregroundStyle(Colors.TextColors.primary)
                    }
            }
        }
        .padding(.horizontal, 22.5)
    }
}

#Preview {
    ButtonView(title: "Запустить", action: {})
}
