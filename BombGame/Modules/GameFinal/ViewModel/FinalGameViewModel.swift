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
    
    private let dataManager: DataManager
    
    init(model: FinalGameModel, manager: DataManager) {
        dataManager = manager
        self.model = model
        
        currentPunishment = dataManager.getPunishments()
        punishmentTitle = model.text.punishmentTitle
        navTitle = model.text.navTitle
        resetTitle = model.text.resetTitle
    }
    
    func getAnotherPunishment() {
        currentPunishment = dataManager.getPunishments()
    }
}
