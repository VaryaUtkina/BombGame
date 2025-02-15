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
    
}
