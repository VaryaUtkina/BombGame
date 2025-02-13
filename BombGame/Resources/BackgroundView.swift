//
//  BackgroundView.swift
//  BombGame
//
//  Created by Варвара Уткина on 13.02.2025.
//

import SwiftUI

struct BackgroundView<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                Colors.ComponentsColors.gameBackground
                    .ignoresSafeArea()
                
                CurvedShape()
                    .ignoresSafeArea()
                    .foregroundStyle(.curvedShape)
                
                VStack {
                    content
                }
            }
        }
    }
}

#Preview {
    BackgroundView {
        Text("Привет!")
    }
}
