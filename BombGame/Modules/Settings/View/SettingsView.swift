//
//  SettingsView.swift
//  BombGame
//
//  Created by nikita on 14.02.25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        BackgroundView {
            VStack {
                Text("Test1")
                Text("Test2")
                Text("Test3")
            }
            .section()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: { dismiss() }) {
                    Image(systemName: "chevron.left")
                        .resizable()
                        .frame(width: 12, height: 20)
                        .foregroundStyle(Color.primaryText)
                        .font(.title.weight(.bold))
                }
            }
            ToolbarItem(placement: .principal) {
                Text("Настройки")
                    .font(Font.customFont(size: 30).weight(.black))
                    .foregroundStyle(Color.primaryText)
            }
        }
    }
}

struct SettingsSectionViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .background(Color.red)
            
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.green, lineWidth: 3)
            )
            .padding(10)
    }
}

extension View {
    func section() -> some View {
        modifier(SettingsSectionViewModifier())
    }
}

#Preview {
    SettingsView()
}
