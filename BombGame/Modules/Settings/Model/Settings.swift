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
    var isVibrationEnabled: Bool
    var isPunishmentsEnabled: Bool
    
    static let defaultSettings = Settings(
        gameDuration: .medium,
        backgroundMusic: .music1,
        tickMusic: .music1,
        explosionMusic: .music1,
        isVibrationEnabled: true,
        isPunishmentsEnabled: true
    )
}

extension Settings {
    enum GameDuration: String, CaseIterable {
        case short = "Короткое"
        case medium = "Среднее"
        case long = "Длинное"
        case random = "Случайное"
        
        var duration: CGFloat {
            switch self {
            case .short:
                10
            case .medium:
                30
            case .long:
                60
            case .random:
                CGFloat.random(in: 10...60)
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
                "backgroundMusic1"
            case .music2:
                "backgroundMusic2"
            case .music3:
                "backgroundMusic3"
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
                "tickMusic1"
            case .music2:
                "tickMusic2"
            case .music3:
                "tickMusic3"
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
                "explosionMusic1"
            case .music2:
                "explosionMusic2"
            case .music3:
                "explosionMusic3"
            }
        }
    }
}
