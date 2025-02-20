//
//  AppViewModel.swift
//  BombGame
//
//  Created by nikita on 20.02.25.
//

final class AppViewModel {
    private let storageManager: StorageManager
    private let settingsManager: SettingsManager
    private let dataManager: DataManager
    
    init() {
        self.storageManager = StorageManager.shared
        self.settingsManager = SettingsManager.shared
        self.dataManager = DataManager.shared
    }
    
    func goToBackround() {
        storageManager.saveSettings(
            settingsManager.settings
        )
        storageManager.saveOwnQuestions(
            dataManager.gameData.ownQuestions
        )
    }
}
