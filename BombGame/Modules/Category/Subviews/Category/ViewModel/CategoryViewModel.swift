//
//  CategoryViewModel.swift
//  BombGame
//
//  Created by nikita on 12.02.25.
//

import Foundation

final class CategoryViewModel: ObservableObject {
    private let manager = DataManager.shared
    let category: Category
    
    @Published var isActive: Bool
    @Published var showCheckmark: Bool
    
    init(category: Category, blind: Bool = false) {
        self.category = category
        self.isActive = manager.isActive(category) && !blind
        self.showCheckmark = manager.isActive(category) || blind
    }
    
    func toggleActive() {
        manager.toggleCategory(category)
        isActive = manager.isActive(category)
        showCheckmark = manager.isActive(category)
        objectWillChange.send()
    }
}
