//
//  MainView.swift
//  BombGame
//
//  Created by Варвара Уткина on 09.02.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(Colors.ComponentsColors.mainBackground)
            Text("Hello, world!")
                .font(Font.customFont(size: 50).bold())
        }
        .padding()
    }
}

#Preview {
    MainView()
}
