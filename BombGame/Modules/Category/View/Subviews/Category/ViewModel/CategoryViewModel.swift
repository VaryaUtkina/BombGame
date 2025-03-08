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
    let isBlind: Bool
    
    @Published var isActive: Bool
    @Published var showCheckmark: Bool
    @Published var navigateToOwnCategory: Bool
    
    init(category: Category, isBlind: Bool = false) {
        self.category = category
        self.isBlind = isBlind
        self.isActive = manager.isActive(category) && !isBlind
        self.showCheckmark = manager.isActive(category) || isBlind
        self.navigateToOwnCategory = false
    }
    
    func toggleActive() {
        if category.id == .own && !isActive {
            navigateToOwnCategory = true
        } else {
            navigateToOwnCategory = false
        }
        
        if category.id != .own || isActive {
            manager.toggleCategory(category)
        }
        
        isActive = manager.isActive(category)
        showCheckmark = manager.isActive(category)
    }
    
    func checkSelection() {
        isActive = manager.isActive(category) && !isBlind
        showCheckmark = isActive || isBlind
    }
}
