//
//  MainView.swift
//  BombGame
//
//  Created by Варвара Уткина on 09.02.2025.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel(model: MainTexts())
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.mainBackground)
                
                Image(.mainbackgroundShape)
                    .resizable()
                
                VStack(spacing: 60) {
                    TitleTextView(topText: viewModel.texts.title,
                                  bottomText: viewModel.texts.gameName)
                    
                    Image(.mainbomb)
                        .resizable()
                        .frame(width: 274, height: 300)
                    
                    VStack {
                        NavigationLink(destination: GameView()) {
                            MainButton(text: viewModel.texts.startGame)
                        }
                        
                        NavigationLink(destination: CategoriesView()) {
                            MainButton(text: viewModel.texts.categories)
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
                        viewModel.isShowingRules = true
                    } label: {
                        Image(systemName: viewModel.texts.questionMark)
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
                    // Change to SettingsView()
                    NavigationLink(destination: SettingsView()) {
                        Image(viewModel.texts.gear)
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(Color.primary)
                    }
                }
            }
            .sheet(isPresented: $viewModel.isShowingRules) {
                RulesView()
                    .presentationDetents([.fraction(0.78)])
            }
        }
    }
}
#Preview {
    MainView()
}


