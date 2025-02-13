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
                // TODOO change correct color
                Color(red: 255/255, green: 250/255, blue: 94/255)
                    .ignoresSafeArea()
                
                Image(.mainbackgroundShape)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 70) {
                    TitleTextView(topText: "ИГРА ДЛЯ КОМПАНИИ",
                                  bottomText: "БОМБА")
                    
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


