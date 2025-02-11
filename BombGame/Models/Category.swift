//
//  Category.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

struct Category: Identifiable {
    let id: Int
    let title: String
    let questions: [String]
    let imageName: String
    
    static func getTests() -> [Category] {
        var categories: [Category] = []
        for i in 1...10 {
            var questions: [String] = []
            for j in 1...20 {
                questions.append("Вопрос \(j)")
            }
            categories.append(
                Category(
                    id: i,
                    title: "Категория \(i)",
                    questions: questions,
                    imageName: "Картинка \(i)"
                )
            )
        }
        return categories
    }
}
