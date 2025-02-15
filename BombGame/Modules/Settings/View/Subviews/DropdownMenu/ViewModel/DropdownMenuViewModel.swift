//
//  DropdownMenuViewModel.swift
//  BombGame
//
//  Created by nikita on 15.02.25.
//

import Foundation

final class DropdownMenuViewModel: ObservableObject {
    @Published var isExpanded = false
    @Published var selectedOption = ""
    let options: [String]
    let manager = SettingsManager.shared
    
    init<T: StringType>(_ type: T.Type) {
        options = type.allCases.map { $0.rawValue }
        
        let parametrs = Mirror(reflecting: manager.getSettings()).children
        
        for parametr in parametrs {
            if let item = parametr as? T {
                print("item:", item)
            }
        }
    }
    
    func pressed() {
        isExpanded.toggle()
    }
}
