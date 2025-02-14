//
//  MainView.swift
//  BombGame
//
//  Created by Варвара Уткина on 09.02.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 255/255, green: 250/255, blue: 94/255)
                Image(.mainbackgroundShape)
                    .resizable()
                
                VStack(spacing: 70) {
                    HStack {
                        NavigationLink(destination: SettingsView()) {
                            Image("SettingsGear")
                                .resizable()
                                .frame(width: 35, height: 35)
                        }
                        Spacer()
                    }
                    .padding(.horizontal, 30)
                    
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
                        NavigationLink(destination: GameView()) {
                            MainButton(text: "Старт игры")
                        }
                        
                        NavigationLink(destination: CategoriesView()) {
                            MainButton(text: "Категории")
                        }
                    }
                    .padding(.horizontal, 23)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    MainView()
}


