//
//  CategoriesManager.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    private let settingsManager: SettingsManager
    private let storageManager: StorageManager
    
    private(set) var gameData: GameData
    
    private var questionQueue: [String] = []
    private var punishmentQueue: [String] = []
    
    private init() {
        settingsManager = SettingsManager.shared
        storageManager = StorageManager.shared
        gameData = GameData()
        gameData.ownQuestions = storageManager.loadOwnQuestions()
    }
    
    func getAllCategories() -> [Category] {
        gameData.allCategories
    }
    
    func toggleCategory(_ category: Category) {
        settingsManager.toggleCategoryIndex(category.id)
        questionQueue.removeAll()
    }
    
    func isActive(_ category: Category) -> Bool {
        settingsManager.settings.selectedCategoriesKind.contains(category.id)
    }
    
    func getQuestion() -> String {
        if questionQueue.isEmpty {
            makeQuestionsQueue()
        }
        return questionQueue.removeLast()
    }
    
    func getPunishments() -> String {
        if punishmentQueue.isEmpty {
            punishmentQueue = gameData.punishments.shuffled()
        }
        return punishmentQueue.removeLast()
    }
    
    func addOwnQuestion(_ question: String) {
        gameData.ownQuestions.append(question)
    }
    
    func deleteOwnQuestion(at question: String) {
        if let index = gameData.ownQuestions.firstIndex(of: question) {
            gameData.ownQuestions.remove(at: index)
        }
    }
    
    private func makeQuestionsQueue() {
        (
            settingsManager.settings.selectedCategoriesKind.isEmpty
            ? gameData.allCategories
            : Array(gameData.allCategories.filter{ category in
                settingsManager.settings.selectedCategoriesKind.contains(category.id)
            })
        )
        .forEach { category in
            questionQueue += category.questions
        }
        
        if settingsManager.settings.selectedCategoriesKind.contains(.own) {
            questionQueue += gameData.ownQuestions
        }
        
        questionQueue = questionQueue.shuffled()
    }
}
