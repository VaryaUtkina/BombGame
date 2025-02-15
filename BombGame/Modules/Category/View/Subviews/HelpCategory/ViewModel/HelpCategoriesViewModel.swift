//
//  HelpCategoriesViewModel.swift
//  BombGame
//
//  Created by nikita on 14.02.25.
//

import Foundation

final class HelpCategoriesViewModel {
    let categories: [Category] = DataManager.shared.getAllCategories()
}
