//
//  FinalGameView.swift
//  BombGame
//
//  Created by Варвара Уткина on 12.02.2025.
//

import SwiftUI

struct FinalGameView: View {
    @StateObject private var viewModel = FinalGameViewModel(
        model: FinalGameModel(),
        manager: DataManager.shared
    )
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        BackgroundView {
            Spacer(minLength: 4)
            
            Image(.explosion)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: 370)
            
            Spacer(minLength: 4)
            
            Text(viewModel.currentPunishment)
                .multilineTextAlignment(.center)
                .font(Font.customFont(size: 28).weight(.semibold))
                .foregroundStyle(Colors.TextColors.primary)
                .padding(.horizontal, 23.5)
                .transition(.opacity)
                .frame(minHeight: 170)
            
            
            VStack(spacing: 16) {
                ButtonView(title: viewModel.punishmentTitle) {
                    withAnimation {
                        viewModel.getAnotherPunishment()
                    }
                }
                
                ButtonView(title: viewModel.resetTitle) {
                    // TODO: - не работает, пока нет навигации
                    dismiss()
                }
            }
            .padding(.bottom, 16)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(viewModel.navTitle)
                        .font(Font.customFont(size: 30).weight(.black))
                        .foregroundStyle(Colors.TextColors.primary)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FinalGameView()
}
