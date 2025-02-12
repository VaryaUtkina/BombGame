//
//  GameViewModel.swift
//  BombGame
//
//  Created by lorenc_D_K on 12.02.2025.
//

import Foundation

final class GameViewModel: ObservableObject {
    @Published var model: GameModel
    @Published var topText: String
    @Published var isGameLaunched = false
    
    
    init(model: GameModel) {
        self.model = model
        topText = model.texts.launchGame
    }
    
    func startGame() {
        isGameLaunched = true
        topText = model.questions.randomElement() ?? ""
    }
    
    func endGame() {
        isGameLaunched = false
        topText = model.texts.launchGame
    }
}
