//
//  RuleModel.swift
//  BombGame
//
//  Created by Sergey Zakurakin on 2/13/25.
//

import Foundation

struct RuleModel: Identifiable {
    let id = UUID()
    let number: String
    let text: String
    let showRectangle: Bool
    
    
    // Обработку текста с цветом
    var attributedText: AttributedString {
            var attributedString = AttributedString(text)
            if let range = attributedString.range(of: "С Заданиями") {
                attributedString[range].foregroundColor = .purple
            }
            return attributedString
        }
    
}
