//
//  GameModel.swift
//  BombGame
//
//  Created by lorenc_D_K on 12.02.2025.
//


struct GameModel {
    let texts: Texts
    let explosionSound: String
    let pauseImage: String
    let playImage: String
    
    init() {
        texts = Texts()
        explosionSound = "explosion"
        pauseImage = "pause.circle"
        playImage = "play.circle"
    }
}
