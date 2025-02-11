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
                
                CurvedShape()
                    .ignoresSafeArea()
                    .foregroundStyle(.curvedShape)
                
                
                VStack {
                    Text("Нажмите \"Запустить\" чтобы начать игру")
                        .multilineTextAlignment(.center)
                        .font(Font.customFont(size: 28).weight(.medium))
                        .foregroundStyle(Colors.TextColors.primary)
                    
                    Spacer()
                    
                    Button {
                        // TODO: - запустить игру
                    } label: {
                        Text("Запустить")
                            .font(Font.customFont(size: 20).weight(.bold))
                            .foregroundStyle(Colors.TextColors.primary)
                    }
                    .frame(maxWidth: .infinity, minHeight: 55)
                    .background(Colors.ComponentsColors.gameViewButton)
                    .clipShape(.rect(cornerRadius: 10))
                }
                .padding(.horizontal, 22.5)
                .padding(.bottom, 28)
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
