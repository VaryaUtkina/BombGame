//
//  SettingsView.swift
//  BombGame
//
//  Created by nikita on 14.02.25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = SettingsViewModel()
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 44),
        GridItem(.flexible())
    ]
    
    var body: some View {
        BackgroundView {
            ScrollView {
                VStack(spacing: 18) {
                    Spacer()
                        .frame(height: 20)
                    SettingsSection {
                        VStack {
                            HStack {
                                Text("ВРЕМЯ ИГРЫ")
                                    .font(Font.customFont(size: 20).weight(.bold))
                                    .foregroundStyle(Color.primaryText)
                                Spacer()
                            }
                            
                            LazyVGrid(columns: columns, spacing: 20) {
                                ForEach(viewModel.durations, id: \.self) { duration in
                                    Button(action: {viewModel.changeDuration(duration)}) {
                                        Text(duration)
                                            .font(
                                                Font
                                                    .customFont(size: 18)
                                                    .weight(.black)
                                            )
                                            .foregroundStyle(
                                                viewModel.currentDuration == duration
                                                ? Color.primaryText
                                                : Color.white
                                            )
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 40)
                                    }
                                    .background(viewModel.currentDuration == duration
                                                ? Color.gameViewButton
                                                : Color.primaryText
                                    )
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                }
                            }
                        }
                        .padding(18)
                    }
                    
                    SettingsSection {
                        VStack(spacing: 18) {
                            DropdownMenuView(
                                viewModel: DropdownMenuViewModel (
                                    Settings.BackgroundMusic.self
                                ),
                                title: "Фоновая музыка"
                            )
                            DropdownMenuView(
                                viewModel: DropdownMenuViewModel (
                                    Settings.TickMusic.self
                                ),
                                title: "Тиканье бомбы"
                            )
                            DropdownMenuView(
                                viewModel: DropdownMenuViewModel (
                                    Settings.ExplosionMusic.self
                                ),
                                title: "Взрыв бомбы"
                            )
                        }
                        .padding()
                    }
                    
                    SettingsSection {
                        VStack(spacing: 18) {
                            ToggleStackView(
                                toggleState: $viewModel.isVibrationOn,
                                function: viewModel.toggleVibration,
                                title: "Вибрация"
                            )
                            
                            ToggleStackView(
                                toggleState: $viewModel.isPunishmentsOn,
                                function: viewModel.togglePunishments,
                                title: "Игра с заданиями"
                            )
                        }
                        .padding()
                    }
                }
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 12, height: 20)
                        .foregroundStyle(Color.primaryText)
                        .font(.title.weight(.bold))
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Настройки")
                    .font(Font.customFont(size: 30).weight(.black))
                    .foregroundStyle(Color.primaryText)
            }
        }
    }
}

#Preview {
    SettingsView()
}
