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
        dataManager: DataManager.shared,
        settingsManager: SettingsManager.shared
    )
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        BackgroundView {
            VStack {
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
                    .transition(.opacity)
                    .frame(minHeight: 170)
                    .opacity(viewModel.isPunishmentsEnabled ? 1 : 0)
                
                VStack(spacing: 16) {
                    ButtonView(title: viewModel.punishmentTitle) {
                        withAnimation {
                            viewModel.getAnotherPunishment()
                        }
                    }
                    .opacity(viewModel.isPunishmentsEnabled ? 1 : 0)
                    
                    ButtonView(title: viewModel.resetTitle) {
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
            .padding(.horizontal, 23)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    FinalGameView()
}
