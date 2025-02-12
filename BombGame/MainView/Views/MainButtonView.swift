//
//  MainButtonView.swift
//  BombGame
//
//  Created by Sergey Zakurakin on 2/12/25.
//

import SwiftUI

struct MainCustomButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(Font.customFont(size: 20).weight(.bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(.gameBackground))
                .cornerRadius(12)
        }
    }
}

#Preview {
    MainCustomButton(title: "Start", action: {})
}
