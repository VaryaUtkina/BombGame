//
//  Category.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import Foundation

struct Category: Identifiable, Hashable {
    let id: UUID
    let title: String
    let questions: [String]
    let imageName: String
}
