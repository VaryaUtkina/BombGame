//
//  BombGameApp.swift
//  BombGame
//
//  Created by Варвара Уткина on 09.02.2025.
//

import SwiftUI

@main
struct BombGameApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .background {
                StorageManager.shared.saveSettings(
                    SettingsManager.shared.settings
                )
                StorageManager.shared.saveOwnQuestions(
                    DataManager.shared.gameData.ownQuestions
                )
            }
        }
    }
}
