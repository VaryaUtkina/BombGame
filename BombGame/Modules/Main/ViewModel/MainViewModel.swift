//
//  MainViewModel.swift
//  BombGame
//
//  Created by lorenc_D_K on 15.02.2025.
//

import Foundation

final class MainViewModel: ObservableObject {
    @Published var isShowingRules = false
    let texts: MainTexts
    
    init(model: MainTexts) {
        texts = model
    }
    
}
