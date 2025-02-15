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
    let type: any StringType.Type
    
    init<T: StringType>(_ type: T.Type) {
        self.type = type
        options = type.allCases.map { $0.rawValue }
        
        let parametrs = Mirror(reflecting: manager.getSettings()).children
        
        for parametr in parametrs {
            if let item = parametr.value as? T {
                selectedOption = item.rawValue
            }
        }
    }
    
    func pressed() {
        isExpanded.toggle()
    }
    
    
}
