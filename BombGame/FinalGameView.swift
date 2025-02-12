//
//  FinalGameView.swift
//  BombGame
//
//  Created by Варвара Уткина on 12.02.2025.
//

import SwiftUI

struct FinalGameView: View {
    @State private var punishments = Punishment.getPunishmentList()
    @State private var currentPunishment: Punishment?
    
    var body: some View {
        NavigationStack {
            ZStack {
                Colors.ComponentsColors.gameBackground
                    .ignoresSafeArea()
                
                CurvedShape()
                    .ignoresSafeArea()
                    .foregroundStyle(.curvedShape)
                
                
                VStack {
                    Image(.explosion)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 249, height: 300)
                        .padding(.top, 40)
                    
                    Spacer()
                    
                    Text(currentPunishment?.text ?? "Спой арию")
                        .multilineTextAlignment(.center)
                        .font(Font.customFont(size: 28).weight(.semibold))
                        .foregroundStyle(Colors.TextColors.primary)
                        .padding(.horizontal, 23.5)
                        .transition(.opacity)
                    
                    
                    VStack(spacing: 16) {
                        CustomButtonView(title: "Другое задание") {
                            withAnimation {
                                getAnotherPunishment()
                            }
                        }
                        CustomButtonView(title: "Начать заново") {
                            // TODO: - реализовать action
                        }
                    }
                }
                .padding(.bottom, 16)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Конец игры")
                        .font(Font.customFont(size: 30).weight(.black))
                        .foregroundStyle(Colors.TextColors.primary)
                }
            }
            .onAppear {
                currentPunishment = punishments.first
            }
        }
    }
    
    private func getAnotherPunishment() {
        if punishments.isEmpty {
            punishments = Punishment.getPunishmentList()
        } else {
            punishments.removeFirst()
        }
        currentPunishment = punishments.first
    }
}

#Preview {
    FinalGameView()
}
