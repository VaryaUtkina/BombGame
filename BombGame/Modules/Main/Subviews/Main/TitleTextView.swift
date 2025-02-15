//
//  TitleTextView.swift
//  BombGame
//
//  Created by Sergey Zakurakin on 2/12/25.
//

import SwiftUI

struct TitleTextView: View {
    let topText: String
    let bottomText: String
    
    var body: some View {
        VStack {
            Text(topText)
                .font(Font.customFont(size: 28).weight(.black))
            Text(bottomText)
                .font(Font.customFont(size: 48).weight(.black))
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .foregroundStyle(Colors.TextColors.primary)
    }
}
#Preview {
    TitleTextView(topText: "ИГРА ДЛЯ КОМПАНИИ", bottomText: "БОМБА")
}
