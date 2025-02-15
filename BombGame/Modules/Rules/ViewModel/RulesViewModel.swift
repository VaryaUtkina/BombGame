//
//  RulesViewModel.swift
//  BombGame
//
//  Created by Sergey Zakurakin on 2/13/25.
//

import SwiftUI

final class RulesViewModel: ObservableObject {
    
    @Published var rules: [Rule]
    let title: String
    
    init(model: Rules) {
        self.rules = model.rules
        title = "Правила игры"
    }
    
}
