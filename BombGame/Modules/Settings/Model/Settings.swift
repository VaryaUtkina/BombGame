//
//  Settings.swift
//  BombGame
//
//  Created by nikita on 14.02.25.
//

import Foundation

struct Settings {
    var gameDuration: GameDuration
    var backgroundMusic: BackgroundMusic
    var tickMusic: TickMusic
    var explosionMusic: ExplosionMusic
    var vibrationEnable: Bool
    var punishmentsEnable: Bool
    
    static let defaultSettings = Settings(
        gameDuration: .medium,
        backgroundMusic: .music1,
        tickMusic: .music1,
        explosionMusic: .music1,
        vibrationEnable: true,
        punishmentsEnable: true
    )
}

extension Settings {
    enum GameDuration: Int, CaseIterable {
        case short = 10
        case medium = 30
        case long = 60
        
        var random: GameDuration {
            GameDuration.allCases.randomElement() ?? .short
        }
    }
    
    enum BackgroundMusic: String, CaseIterable {
        case music1 = "BackgroundMusic1"
        case music2 = "BackgroundMusic2"
        case music3 = "BackgroundMusic3"
    }
    
    enum TickMusic: String, CaseIterable {
        case music1 = "TickMusic1"
        case music2 = "TickMusic2"
        case music3 = "TickMusic3"
    }
    
    enum ExplosionMusic: String, CaseIterable {
        case music1 = "ExplosionMusic1"
        case music2 = "ExplosionMusic2"
        case music3 = "ExplosionMusic3"
    }
}
