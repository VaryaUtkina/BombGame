//
//  OwnQuestionsModel.swift
//  BombGame
//
//  Created by nikita on 25.02.25.
//

struct OwnQuestionsModel {
    let texts: OwnQuestionsTexts
    let maximumInputTextCount: Int
    
    init() {
        texts = OwnQuestionsTexts()
        maximumInputTextCount = 100
    }
}
