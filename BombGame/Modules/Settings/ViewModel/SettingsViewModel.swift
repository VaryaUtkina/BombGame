//
//  SettingsViewModel.swift
//  BombGame
//
//  Created by nikita on 14.02.25.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    private let manager: SettingsManager
    
    @Published var currentDuration: String
    @Published var isVibrationOn: Bool
    @Published var isPunishmentsOn: Bool
    @Published var isBackgroundMusicEnable: Bool
    
    let durations = Settings.GameDuration.allCases.map{ $0.rawValue }
    
    init() {
        manager = SettingsManager.shared
        currentDuration = manager.settings.gameDuration.rawValue
        isVibrationOn = manager.settings.isVibrationEnabled
        isPunishmentsOn = manager.settings.isPunishmentsEnabled
        isBackgroundMusicEnable = manager.settings.isBackgroundMusicEnable
    }
    
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
    
    func toggleBackgroundMusic() {
        manager.toggleBackgroundMucis()
    }
    
}
