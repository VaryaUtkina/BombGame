//
//  BombGameApp.swift
//  BombGame
//
//  Created by Варвара Уткина on 09.02.2025.
//

import SwiftUI

@main
struct BombGameApp: App {
    @Environment(\.scenePhase) private var scenePhase
    
    private let viewModel: AppViewModel
    
    init() {
        viewModel = AppViewModel()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .background {
                viewModel.goToBackround()
            }
        }
    }
}
