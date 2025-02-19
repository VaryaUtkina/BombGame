//
//  CategoriesManager.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    private let settingsManager = SettingsManager.shared
    private let storageManager = StorageManager.shared
    
    private var gameData = GameData()
    
    private var questionQueue: [String] = []
    private var punishmentQueue: [String] = []
    
    private init() {}
    
    func getAllCategories() -> [Category] {
        gameData.allCategories
    }
    
    func toggleCategory(_ category: Category) {
        settingsManager.toggleCategoryIndex(category.id)
        questionQueue.removeAll()
    }
    
    func isActive(_ category: Category) -> Bool {
        settingsManager.settings.selectedCategoriesIndexes.contains(category.id)
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
        storageManager.saveOwnQuestion(question)
        gameData = GameData()
    }
    
    private func makeQuestionsQueue() {
        (
            settingsManager.settings.selectedCategoriesIndexes.isEmpty
            ? gameData.allCategories
            : Array(gameData.allCategories.filter{ category in
                settingsManager.settings.selectedCategoriesIndexes.contains(category.id)
            })
        )
        .forEach { category in
            questionQueue += category.questions
        }
        
        questionQueue = questionQueue.shuffled()
    }
}
