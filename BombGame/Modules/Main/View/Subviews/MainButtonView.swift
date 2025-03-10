//
//  MainButton.swift
//  BombGame
//
//  Created by Sergey Zakurakin on 2/12/25.
//

import SwiftUI

struct MainButton: View {
    var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(.mainSheetBg)
            .frame(height: 55)
            .overlay {
                Text(text)
                    .font(Font.customFont(size: 20).weight(.medium))
                    .foregroundStyle(Colors.TextColors.primary)
            }
    }
}

#Preview {
    MainButton(text: "Старт игры")
}
