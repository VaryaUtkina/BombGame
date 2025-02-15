//
//  SettingsView.swift
//  BombGame
//
//  Created by nikita on 14.02.25.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = SettingsViewModel()
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 23),
        GridItem(.flexible())
    ]
    
    var body: some View {
        BackgroundView {
            VStack {
                HStack {
                    Text("ВРЕМЯ ИГРЫ")
                        .font(Font.customFont(size: 20).weight(.bold))
                        .foregroundStyle(Color.primaryText)
                    Spacer()
                }
                .padding(18)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 34) {
                        ForEach(viewModel.durations, id: \.self) { duration in
                            Text("\(duration)")
                        }
                    }
                }
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
            .background(Color.categoryCellBg)
        
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.primaryText, lineWidth: 1)
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
