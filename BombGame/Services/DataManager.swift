//
//  CategoriesManager.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import Foundation

final class DataManager {
    static let shared = DataManager()
    
    private let data = Data()
    
    private var selectedCategories: Set<Category> = []
    private var questionQueue: [String] = []
    private var punishmentQueue: [String] = []
    
    private init() {}
    
    func getSettings() -> Settings {
        data.settings
    }
    
    func getAllCategories() -> [Category] {
        data.allCategories
    }
    
    func toggleCategory(_ category: Category) {
        if selectedCategories.contains(category) {
            selectedCategories.remove(category)
        } else {
            selectedCategories.insert(category)
        }
    }
    
    func isActive(_ category: Category) -> Bool {
        selectedCategories.contains(category)
    }
    
    func getQuestion() -> String {
        if questionQueue.isEmpty {
            makeQuestionsQueue()
        }
        return questionQueue.removeLast()
    }
    
    func getPunishments() -> String {
        if punishmentQueue.isEmpty {
            punishmentQueue = data.punishments.shuffled()
        }
        return punishmentQueue.removeLast()
    }
    
    private func makeQuestionsQueue() {
        (selectedCategories.isEmpty ? data.allCategories : Array(selectedCategories)).forEach { category in
            questionQueue += category.questions
        }
        questionQueue = questionQueue.shuffled()
    }
}
