//
//  OwnQuestionsViewModel.swift
//  BombGame
//
//  Created by nikita on 23.02.25.
//

import Foundation

final class OwnQuestionsViewModel: ObservableObject {
    @Published var model: OwnQuestionsModel
    @Published var inputText: String = ""
    @Published var questions: [String] = []
    
    let manager: DataManager
    let maximumInputTextCount: Int
    
    init(model: OwnQuestionsModel) {
        self.model = model
        manager = DataManager.shared
        questions = manager.gameData.ownQuestions
        maximumInputTextCount = model.maximumInputTextCount
    }
    
    func saveQuestion() {
        guard !inputText.isEmpty else { return }
        manager.addOwnQuestion(inputText)
        questions = manager.gameData.ownQuestions
        inputText = ""
    }
    
    func deleteQuestion(_ question: String) {
        manager.deleteOwnQuestion(at: question)
        questions = manager.gameData.ownQuestions
    }
}
