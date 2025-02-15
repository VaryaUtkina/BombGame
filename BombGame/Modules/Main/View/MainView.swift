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
                    .ignoresSafeArea()
                
                Image(.mainbackgroundShape)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack() {
                    Spacer(minLength: 50)
                    
                    TitleTextView(topText: viewModel.texts.title,
                                  bottomText: viewModel.texts.gameName)
                    
                    Spacer(minLength: 20)
                    
                    Image(.mainbomb)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 300)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 10)
                    
                    Spacer(minLength: 20)
                    
                    VStack(spacing: 10) {
                        NavigationLink(destination: GameView()) {
                            MainButton(text: viewModel.texts.startGame)
                        }
                        
                        NavigationLink(destination: CategoriesView()) {
                            MainButton(text: viewModel.texts.categories)
                        }
                    }

                    .padding(.horizontal, 23)
                    
                    Spacer(minLength: 40)
                }
                .padding(.top, 60)
                .padding(.bottom, 70)
            }
            
            
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
                    NavigationLink(destination: EmptyView()) {
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


