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
        settings = StorageManager.shared.loadSettings()
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
    
    func toggleVibration() {
        settings.isVibrationEnabled.toggle()
    }
    
    func togglePunishments() {
        settings.isPunishmentsEnabled.toggle()
    }
    
    func toggleBackgroundMucis() {
        settings.isBackgroundMusicEnable.toggle()
    }
    
    func toggleCategoryIndex(_ kind: CategoryKind) {
        if settings.selectedCategoriesKind.contains(kind) {
            settings.selectedCategoriesKind.remove(kind)
        } else {
            settings.selectedCategoriesKind.insert(kind)
        }
    }
}
