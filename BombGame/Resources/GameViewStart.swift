//
//  GameViewStart.swift
//  BombGame
//
//  Created by Варвара Уткина on 11.02.2025.
//

import SwiftUI

struct GameViewStart: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Colors.ComponentsColors.gameBackground
                    .ignoresSafeArea()
                
                VStack {
                    Text("test")
                    
                    Button {
                        
                    } label: {
                        Text("Запустить")
                            .font(Font.customFont(size: 20).weight(.bold))
                            .foregroundStyle(Colors.TextColors.primary)
                    }
                    .frame(maxWidth: .infinity, minHeight: 55)
                    .padding(.horizontal, 22.5)
                    .background(Colors.ComponentsColors.gameViewButton)
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Игра")
                        .font(Font.customFont(size: 30).weight(.black))
                        .foregroundStyle(Colors.TextColors.primary)
                }
            }
        }
    }
}

#Preview {
    GameViewStart()
}
