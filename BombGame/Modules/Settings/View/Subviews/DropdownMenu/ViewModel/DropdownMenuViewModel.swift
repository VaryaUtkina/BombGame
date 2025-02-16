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
    let parametrType: any StringType.Type
    
    init<T: StringType>(_ type: T.Type) {
        parametrType = type
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
    
    func change(_ option: String) {
        setParametr(option, for: parametrType)
        selectedOption = option
        pressed()
    }
    
    private func setParametr<T: StringType>(_ option: String, for type: T.Type) {
        let parametrs = Mirror(reflecting: manager.getSettings()).children
        
        for parametr in parametrs {
            if parametr.value is T, let item = T(rawValue: option) {
                manager.setMusic(item)
            }
        }
    }
}
