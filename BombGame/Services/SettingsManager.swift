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
    
    private init() {}
    
    func getSettings() -> Settings {
        settings
    }
    
    func getCurrentMusic<T: StringType>(for type: T.Type) -> T? {
            if let music = settings.backgroundMusic as? T {
                return music
            } else if let music = settings.tickMusic as? T {
                return music
            } else if let music = settings.explosionMusic as? T {
                return music
            }
            
            return nil
        }
    
    func setGameDuration(_ time: Settings.GameDuration) {
        settings.gameDuration = time
    }
    
    func setMusic<T: StringType>(_ music: T) {
        if let music = music as? Settings.BackgroundMusic {
            settings.backgroundMusic = music
        } else if let music = music as? Settings.TickMusic {
            settings.tickMusic = music
        } else if let music = music as? Settings.ExplosionMusic {
            settings.explosionMusic = music
        }
    }
    
    func enableVibration(_ enabled: Bool) {
        settings.vibrationEnable = enabled
    }
    
    func enablePunishments(_ enabled: Bool) {
        settings.punishmentsEnable = enabled
    }
}
