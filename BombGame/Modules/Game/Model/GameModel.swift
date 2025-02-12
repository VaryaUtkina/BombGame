//
//  GameModel.swift
//  BombGame
//
//  Created by lorenc_D_K on 12.02.2025.
//


struct GameModel {
    let bombURL: String
    let texts: Texts
    let questions: [String]
    
    init() {
        bombURL = "https://lottie.host/a092c9b5-349c-4b0c-8c8f-ed125da22ab0/763h1v0fsA.lottie"
        texts = Texts()
        questions = [
            "Назови олимпийский вид спорта",
            "Твой любимый киноактер",
            "Назови марку машины",
            "Назови любую страну",
            "Название города с буквой А внутри",
            "Назови любой танец",
            "Твой любимый цвет",
            "Назови продукт с буквой О внутри",
            "Назови марку телефизора",
            "Твой любимый фильм",
        ]
    }
}
