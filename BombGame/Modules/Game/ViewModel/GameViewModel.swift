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
    private let baseAnimationDuration: CGFloat = 1.6
    private let timeToFinishAnimation: CGFloat = 1
    private var gameDuration: CGFloat = 30
    private let audioPlayer: AudioPlayer
    private var timer: Timer?
    private let dataManager: DataManager
    private var counter = 0.0
    
    
    
    init(
        model: GameModel,
        audioPlayer: AudioPlayer,
        dataManager: DataManager,
        settingsManager: SettingsManager
    ) {
        self.model = model
        self.audioPlayer = audioPlayer
        self.dataManager = dataManager
        topText = model.texts.launchGame
        bombURL = URL(string: model.bombURL) ?? URL(filePath: "")
        
    }
    
    func startGame() {
        isGameLaunched = true
        topText = dataManager.getQuestion()
        audioPlayer.playSound(file: model.timerSound, loopsNumber: -1)
        audioPlayer.playBackgroundSound(file: model.backgroundSound)
        counter = gameDuration + timeToFinishAnimation
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
        if counter < 0 {
            endGame()
        } else {
            counter -= 1
            if counter == 1 {
                audioPlayer.playSound(file: model.explosionSound, loopsNumber: 1)
            }
        }
    }
}
