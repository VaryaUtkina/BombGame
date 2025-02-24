//
//  TeamViewModel.swift
//  BombGame
//
//  Created by Варвара Уткина on 24.02.2025.
//

import Foundation

final class TeamViewModel: ObservableObject {
    @Published var model: TeamModel
    
    init(model: TeamModel) {
        self.model = model
    }
}
