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
}
