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
            Text(title)
                .font(Font.customFont(size: 20).weight(.bold))
                .foregroundStyle(Colors.TextColors.primary)
        }
        .frame(maxWidth: .infinity, minHeight: 55)
        .background(Colors.ComponentsColors.gameViewButton)
        .clipShape(.rect(cornerRadius: 10))
        .shadow(radius: 2)
    }
        .padding(.horizontal, 22.5)
    }
}

#Preview {
    ButtonView(title: "Запустить", action: {})
}
