//
//  FinalGameView.swift
//  BombGame
//
//  Created by Варвара Уткина on 12.02.2025.
//

import SwiftUI

struct FinalGameView: View {
    @StateObject private var viewModel = FinalGameViewModel()
    
    var body: some View {
        BackgroundView {
            Image(.explosion)
                .resizable()
                .scaledToFit()
                .frame(width: 249, height: 300)
                .padding(.top, 40)
            
            Spacer()
            
            Text(viewModel.currentPunishment?.text ?? "")
                .multilineTextAlignment(.center)
                .font(Font.customFont(size: 28).weight(.semibold))
                .foregroundStyle(Colors.TextColors.primary)
                .padding(.horizontal, 23.5)
                .transition(.opacity)
            
            
            VStack(spacing: 16) {
                ButtonView(title: viewModel.punishmentTitle) {
                    withAnimation {
                        viewModel.getAnotherPunishment()
                    }
                }
                ButtonView(title: viewModel.resetTitle) {
                    // TODO: - реализовать action
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
    }
}

#Preview {
    FinalGameView()
}
