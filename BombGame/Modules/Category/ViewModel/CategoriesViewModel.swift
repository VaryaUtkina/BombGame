//
//  CategoryViewModel.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import Foundation

final class CategoriesViewModel: ObservableObject {
    @Published var isHelpPresented = false
    
    let categories = CategoriesManager.shared.getAllCategories()
    
    func toggleHelp() {
        isHelpPresented.toggle()
    }
}
