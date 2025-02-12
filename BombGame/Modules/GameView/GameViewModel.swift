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
    let bombURL: URL
    
    
    init(model: GameModel) {
        self.model = model
        topText = model.texts.launchGame
        bombURL = URL(string: model.bombURL) ?? URL(filePath: "")
    }
    
    func startGame() {
        isGameLaunched = true
        topText = model.questions.randomElement() ?? ""
        Task {
            try await Task.sleep(nanoseconds: 3_000_000_000)
            endGame()
        }
    }
    
    func endGame() {
        isGameLaunched = false
        topText = model.texts.launchGame
    }
}
