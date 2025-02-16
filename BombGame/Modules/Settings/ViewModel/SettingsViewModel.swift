//
//  SettingsViewModel.swift
//  BombGame
//
//  Created by nikita on 14.02.25.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    private let manager = SettingsManager.shared
    
    @Published var currentDuration: String = SettingsManager.shared.settings.gameDuration.rawValue
    @Published var isVibrationOn: Bool = SettingsManager.shared.settings.isVibrationEnabled
    @Published var isPunishmentsOn: Bool = SettingsManager.shared.settings.isPunishmentsEnabled
    
    let durations = Settings.GameDuration.allCases.map{ $0.rawValue }
    
    func changeDuration(_ duration: String) {
        for item in Settings.GameDuration.allCases {
            if item.rawValue == duration {
                manager.setGameDuration(item)
                currentDuration = duration
                return
            }
        }
    }
    
    func toggleVibration() {
        manager.toggleVibration()
    }
    
    func togglePunishments() {
        manager.togglePunishments()
    }
    
}
