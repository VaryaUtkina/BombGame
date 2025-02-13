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
    @Published var isGamePaused = false
    @Published var shouldMoveToGameEnd = false
    let bombURL: URL
    var animationSpeed: CGFloat { baseAnimationDuration / gameDuration }
    private let baseAnimationDuration: CGFloat = 2
    private var gameDuration: CGFloat = 30
    private let audioPlayer: AudioPlayer
    private var timer: Timer?
    private let manager: CategoriesManager
    private var counter = 0.0
    
    
    
    init(model: GameModel, audioPlayer: AudioPlayer, manager: CategoriesManager) {
        self.model = model
        self.audioPlayer = audioPlayer
        self.manager = manager
        topText = model.texts.launchGame
        bombURL = URL(string: model.bombURL) ?? URL(filePath: "")
        
    }
    
    func startGame() {
        isGameLaunched = true
        topText = manager.getQuestion()
        audioPlayer.playSound(file: model.timerSound, loopsNumber: -1)
        counter = gameDuration
        startTimer()
    }
    
    func pauseGame() {
        isGamePaused.toggle()
        isGamePaused ? timer?.invalidate() : startTimer()
        audioPlayer.isPlaying ? audioPlayer.pause() : audioPlayer.play()
    }
    
    private func endGame() {
        isGameLaunched = false
        topText = model.texts.launchGame
        audioPlayer.stop()
        timer?.invalidate()
        shouldMoveToGameEnd = true
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            self?.onTimerFires()
        })
    }
    
    private func onTimerFires() {
        print("Counter: ", counter)
        guard counter > 0 else {
            endGame()
            return
        }
            counter -= 1
        if counter == 2 {
            audioPlayer.playSound(file: model.explosionSound, loopsNumber: 1)
        }
    }
}
