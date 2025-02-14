//
//  SettingsManager.swift
//  BombGame
//
//  Created by nikita on 14.02.25.
//

import Foundation

final class SettingsManager {
    static let shared = SettingsManager()

    private var settings = DataManager.shared.getSettings()
    
    init() {}
    
    func getSettings() -> Settings {
        settings
    }
    
    func setGameTime(_ time: Settings.GameTime) {
        settings.gameTime = time
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
