//
//  MainView.swift
//  BombGame
//
//  Created by Варвара Уткина on 09.02.2025.
//

import SwiftUI

struct MainView: View {
    @State private var isStartGameActive = false
    @State private var isCategoriesActive = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 255/255, green: 250/255, blue: 94/255)
                    .ignoresSafeArea()
                
                Image(.mainbackgroundShape)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 70) {
                    VStack {
                        Text("ИГРА ДЛЯ КОМПАНИИ")
                            .font(Font.customFont(size: 28).weight(.black))
                        Text("БОМБА")
                            .font(Font.customFont(size: 48).weight(.black))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(Colors.TextColors.primary)
                    
                    Image(.mainbomb)
                        .resizable()
                        .frame(width: 274, height: 300)
                    
                    VStack {
                        MainCustomButton(title: "Старт Игры") {
                            isStartGameActive.toggle()
                        }
                        
                        MainCustomButton(title: "Категории") {
                            isStartGameActive.toggle()
                            
                        }
                    }
                    .padding(.horizontal, 23)
                }
            }
            .navigationDestination(isPresented: $isStartGameActive) {
                GameViewStart()
            }
            .navigationDestination(isPresented: $isCategoriesActive) {
                GameViewStart()
            }
        }
    }
}

#Preview {
    MainView()
}
