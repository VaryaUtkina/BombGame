//
//  FinalGameViewModel.swift
//  BombGame
//
//  Created by Варвара Уткина on 13.02.2025.
//

import Foundation

final class FinalGameViewModel: ObservableObject {
    @Published var model: FinalGameModel
    @Published var currentPunishment: String
    
    let punishmentTitle: String
    let navTitle: String
    let resetTitle: String
    let isPunishmentsEnabled: Bool
    
    private let dataManager: DataManager
    private let settingsManager: SettingsManager
    
    init(model: FinalGameModel, dataManager: DataManager, settingsManager: SettingsManager) {
        self.model = model
        self.dataManager = dataManager
        self.settingsManager = settingsManager
        isPunishmentsEnabled = settingsManager.settings.isPunishmentsEnabled
        currentPunishment = dataManager.getPunishments()
        punishmentTitle = model.text.punishmentTitle
        navTitle = model.text.navTitle
        resetTitle = model.text.resetTitle
    }
    
    func getAnotherPunishment() {
        currentPunishment = dataManager.getPunishments()
    }
}
