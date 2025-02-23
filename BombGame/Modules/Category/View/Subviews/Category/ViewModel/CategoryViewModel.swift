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
    @Published var navigateToOwnCategory = false
    
    init(category: Category, isBlind: Bool = false) {
        self.category = category
        self.isActive = manager.isActive(category) && !isBlind
        self.showCheckmark = manager.isActive(category) || isBlind
    }
    
    func toggleActive() {
        
        if category.id == .own && !isActive {
            navigateToOwnCategory = true
        }
        
        manager.toggleCategory(category)
        isActive = manager.isActive(category)
        showCheckmark = manager.isActive(category)
        objectWillChange.send()
    }
}
