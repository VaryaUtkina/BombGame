//
//  ToggleStackView.swift
//  BombGame
//
//  Created by nikita on 15.02.25.
//

import SwiftUI

struct ToggleStackView: View {
    @Binding var toggleState: Bool
    let function: () -> Void
    let title: String
    
    var body: some View {
        HStack {
            Text(title)
                .lineLimit(1)
                .font(Font.customFont(size: 16).weight(.bold))
                .foregroundStyle(Color.secondaryText)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            Spacer()
            
            Toggle(isOn: $toggleState) {}
                .labelsHidden()
                .tint(Color.gameViewButton)
                .padding(.trailing)
                .onChange(of: toggleState) { _ in
                    function()
                }
        }
        .background(Color.primaryText)
        .cornerRadius(15)
    }
}
