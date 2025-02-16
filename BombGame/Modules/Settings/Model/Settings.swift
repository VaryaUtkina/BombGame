//
//  Settings.swift
//  BombGame
//
//  Created by nikita on 14.02.25.
//

import Foundation

protocol StringType: CaseIterable, RawRepresentable where RawValue == String {
    var fileName: String { get }
}

struct Settings {
    var gameDuration: GameDuration
    var backgroundMusic: BackgroundMusic
    var tickMusic: TickMusic
    var explosionMusic: ExplosionMusic
    var vibrationEnable: Bool
    var punishmentsEnable: Bool
}

extension Settings {
    enum GameDuration: String, CaseIterable {
        case short = "Короткое"
        case medium = "Среднее"
        case long = "Длинное"
        case random = "Случайное"
        
        var duration: Int {
            switch self {
            case .short:
                10
            case .medium:
                30
            case .long:
                60
            case .random:
                Int.random(in: 10...60)
            }
        }
    }
    
    enum BackgroundMusic: String, StringType {
        case music1 = "Мелодия 1"
        case music2 = "Мелодия 2"
        case music3 = "Мелодия 3"
        
        var fileName: String {
            switch self {
            case .music1:
                "background_music_1"
            case .music2:
                "background_music_2"
            case .music3:
                "background_music_3"
            }
        }
    }
    
    enum TickMusic: String, StringType {
        case music1 = "Часы 1"
        case music2 = "Часы 2"
        case music3 = "Часы 3"
        
        var fileName: String {
            switch self {
            case .music1:
                "tick_music_1"
            case .music2:
                "tick_music_2"
            case .music3:
                "tick_music_3"
            }
        }
    }
    
    enum ExplosionMusic: String, StringType {
        case music1 = "Взрыв 1"
        case music2 = "Взрыв 2"
        case music3 = "Взрыв 3"
        
        var fileName: String {
            switch self {
            case .music1:
                "explosion_music_1"
            case .music2:
                "explosion_music_2"
            case .music3:
                "explosion_music_3"
            }
        }
    }
}
