//
//  CategoryViewModel.swift
//  BombGame
//
//  Created by nikita on 12.02.25.
//

import Foundation
import Combine

final class CategoryViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    let manager = DataManager.shared
    let category: Category
    
    var isActive: Bool
    var showCheckmark: Bool
    
    init(category: Category, showCheckmark: Bool = false) {
        self.category = category
        self.isActive = manager.isActive(category)
        self.showCheckmark = manager.isActive(category) || showCheckmark
    }
    
    func toggleActive() {
        manager.toggleCategory(category)
        isActive = manager.isActive(category)
        showCheckmark = manager.isActive(category)
        objectWillChange.send()
    }
}
