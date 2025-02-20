//
//  Category.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import Foundation

enum CategoryKind: Codable {
    case movie
    case sport
    case celebrities
    case nature
    case aboutLife
    case miscellaneous
    case science
    case games
    case own
}

struct Category: Identifiable, Hashable {
    let id: CategoryKind
    let title: String
    let questions: [String]
    let imageName: String
}
