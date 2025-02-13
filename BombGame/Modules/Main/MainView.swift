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
                // TODOO change correct color
                Color(red: 255/255, green: 250/255, blue: 94/255)
                Image(.mainbackgroundShape)
                    .resizable()
                
                VStack(spacing: 70) {
                    TitleTextView(topText: "ИГРА ДЛЯ КОМПАНИИ",
                                  bottomText: "БОМБА")
                    
                    Image(.mainbomb)
                        .resizable()
                        .frame(width: 274, height: 300)
                    
                    VStack {
                        NavigationLink(destination: GameViewStart()) {
                            MainButtonView(text: "Старт игры")
                        }
                        
                        //TODOO
                        NavigationLink(destination: EmptyView()) {
                            MainButtonView(text: "Категории")
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


