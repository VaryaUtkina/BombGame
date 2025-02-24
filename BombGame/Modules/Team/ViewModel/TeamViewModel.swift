//
//  TeamViewModel.swift
//  BombGame
//
//  Created by Варвара Уткина on 24.02.2025.
//

import Foundation

final class TeamViewModel: ObservableObject {
    @Published var model: TeamModel
    
    let navTitle: String
    let description: String
    let linkText: String
    let link: String
    let developers: [Developer]
    
    private let dataManager: DataManager
    
    init(model: TeamModel, dataManager: DataManager) {
        self.model = model
        self.dataManager = dataManager
        self.developers = dataManager.gameData.developers
        navTitle = model.text.navTitle
        description = model.text.description
        linkText = model.text.linkText
        link = model.text.link
    }
}
