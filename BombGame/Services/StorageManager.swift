//
//  StorageManager.swift
//  BombGame
//
//  Created by nikita on 19.02.25.
//

import Foundation

enum Storage: String{
    case settings = "settings"
    case questions = "questions"
}

final class StorageManager {
    static let shared = StorageManager()
    
    private init() {}
    
    func loadSettings() -> Settings {
        if let data = UserDefaults.standard.data(forKey: Storage.settings.rawValue),
           let settings = try? JSONDecoder().decode(Settings.self, from: data) {
            return settings
        }
        
        return Settings.defaultSettings
    }
    
    func saveSettings(_ settings: Settings) {
        if let encodedSettings = try? JSONEncoder().encode(settings) {
            UserDefaults.standard.set(encodedSettings, forKey: Storage.settings.rawValue)
        }
    }
    
    func loadOwnQuestions() -> [String] {
        if let data = UserDefaults.standard.data(forKey: Storage.questions.rawValue),
           let questions = try? JSONDecoder().decode([String].self, from: data) {
            return questions
        }
        
        return []
    }
    
    func saveOwnQuestions(_ questions: [String]) {
        if let encodedQuestions = try? JSONEncoder().encode(questions) {
            UserDefaults.standard.set(encodedQuestions, forKey: Storage.questions.rawValue)
        }
    }
}
