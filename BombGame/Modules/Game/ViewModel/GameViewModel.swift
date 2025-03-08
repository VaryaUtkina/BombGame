//
//  GameViewModel.swift
//  BombGame
//
//  Created by lorenc_D_K on 12.02.2025.
//

import Foundation
import AudioToolbox

final class GameViewModel: ObservableObject {
    @Published var model: GameModel
    @Published var topText: String
    @Published var isGameLaunched = false
    @Published var isGamePaused = false
    @Published var shouldMoveToGameEnd = false
    var animationSpeed: CGFloat { baseAnimationDuration / gameDuration }
    private let baseAnimationDuration: CGFloat = 1.53
    private let timeToFinishAnimation: CGFloat = 2
    private let timerInterval: CGFloat = 0.1
    private let explosionDelay: CGFloat = -0.5
    private let gameDuration: CGFloat
    private let audioPlayer: AudioPlayer
    private var timer: Timer?
    private let dataManager: DataManager
    private let settingsManager: SettingsManager
    private var counter = 0.0
    private var isExploded = false
    
    
    
    init(
        model: GameModel,
        audioPlayer: AudioPlayer,
        dataManager: DataManager,
        settingsManager: SettingsManager
    ) {
        self.model = model
        topText = model.texts.launchGame
        self.audioPlayer = audioPlayer
        self.dataManager = dataManager
        self.settingsManager = settingsManager
       
        let settings = settingsManager.settings
        gameDuration = settings.gameDuration.duration
    }
    
    func startGame() {
        isGameLaunched = true
        topText = dataManager.getQuestion()
        let tickMusic = settingsManager.settings.tickMusic.fileName
        audioPlayer.playSound(file: tickMusic, loopsNumber: -1)
        if settingsManager.settings.isBackgroundMusicEnable {
            let backgroundMusic = settingsManager.settings.backgroundMusic.fileName
            audioPlayer.playBackgroundSound(file: backgroundMusic)
        }
        counter = gameDuration + timeToFinishAnimation
        startTimer()
    }
    
    func pauseGame() {
        isGamePaused.toggle()
        isGamePaused ? timer?.invalidate() : startTimer()
        audioPlayer.isPlaying ? audioPlayer.pause() : audioPlayer.play()
    }
    
    func dismiss() {
        if isGameLaunched, !isGamePaused {
            pauseGame()
        }
    }
    
    private func endGame() {
        isGameLaunched = false
        topText = model.texts.launchGame
        audioPlayer.stop()
        timer?.invalidate()
        shouldMoveToGameEnd = true
    }
    
    private func startTimer() {
        isExploded = false
        timer = Timer.scheduledTimer(withTimeInterval: timerInterval, repeats: true, block: { [weak self] _ in
            self?.onTimerFires()
        })
    }
    
    private func onTimerFires() {
        if counter < 0 {
            endGame()
        } else {
            counter -= timerInterval
            if counter <= timeToFinishAnimation + explosionDelay {
                makeExplosion()
            }
        }
    }
    
    private func makeExplosion() {
        guard !isExploded else { return }
        isExploded = true
        print(#function, " ", counter)
        let explosionMusic = settingsManager.settings.explosionMusic.fileName
        audioPlayer.playSound(file: explosionMusic, loopsNumber: 1)
        if settingsManager.settings.isVibrationEnabled {
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
}
