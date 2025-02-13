//
//  FinalGameViewModel.swift
//  BombGame
//
//  Created by Варвара Уткина on 13.02.2025.
//

import Foundation

final class FinalGameViewModel: ObservableObject {
    @Published var currentPunishment: String
    
    let punishmentTitle = "Другое задание"
    let resetTitle = "Начать заново"
    let navTitle = "Конец игры"
    
    private let dataManager = DataManager.shared
    
    init() {
        currentPunishment = dataManager.getPunishments()
    }
    
    func getAnotherPunishment() {
        currentPunishment = dataManager.getPunishments()
    }
}
