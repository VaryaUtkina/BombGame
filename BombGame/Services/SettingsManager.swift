//
//  SettingsManager.swift
//  BombGame
//
//  Created by nikita on 14.02.25.
//

import Foundation

final class SettingsManager {
    static let shared = SettingsManager()

    private(set) var settings: Settings
    
    private init() {
        settings = Settings.defaultSettings
    }
    
    func setGameTime(_ time: Settings.GameDuration) {
        settings.gameDuration = time
    }
    
    func setBackgroundMusic(_ music: Settings.BackgroundMusic) {
        settings.backgroundMusic = music
    }
    
    func setTickMusic(_ music: Settings.TickMusic) {
        settings.tickMusic = music
    }
    
    func setExplosionMusic(_ music: Settings.ExplosionMusic) {
        settings.explosionMusic = music
    }
    
    func enableVibration(_ enabled: Bool) {
        settings.vibrationEnable = enabled
    }
    
    func enablePunishments(_ enabled: Bool) {
        settings.punishmentsEnable = enabled
    }
}
