//
//  MainView.swift
//  BombGame
//
//  Created by Варвара Уткина on 09.02.2025.
//

import SwiftUI

struct MainView: View {
    @State private var isShowingRules = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.mainBackground)

                Image(.mainbackgroundShape)
                    .resizable()
                
                VStack(spacing: 60) {
                    TitleTextView(topText: "ИГРА ДЛЯ КОМПАНИИ",
                                  bottomText: "БОМБА")
                    
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
                .padding(.top, 60)
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        isShowingRules = true
                    } label: {
                        Image(systemName: "questionmark.circle.fill")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .foregroundStyle(Color.red)
                            .background(
                                Circle()
                                    .frame(width: 35, height: 35)
                                    .foregroundStyle(.white)
                            )
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                       // SettingsView()
                    } label: {
                        Image("gear")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(Color.primary)
                    }
                }
            }
            .sheet(isPresented: $isShowingRules) {
                RulesView()
                    .presentationDetents([.fraction(0.78)])
            }
        }
    }
}
#Preview {
    MainView()
}


