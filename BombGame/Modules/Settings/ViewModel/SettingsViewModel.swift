//
//  SettingsViewModel.swift
//  BombGame
//
//  Created by nikita on 14.02.25.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    private let manager = SettingsManager.shared
    
    let durations = Settings.GameDuration.allCases.map{$0.rawValue}
    
    @Published var currentDuration: String = SettingsManager.shared.getSettings().gameDuration.rawValue
    
    func changeDuration(_ duration: String) {
        for item in Settings.GameDuration.allCases {
            if item.rawValue == duration {
                manager.setGameDuration(item)
                currentDuration = duration
                return
            }
        }
    }
    
}
