//
//  TeamView.swift
//  BombGame
//
//  Created by Варвара Уткина on 23.02.2025.
//

import SwiftUI

struct TeamView: View {
    let developers = ["Варя", "Дима", "Никита", "Серёжа"]
    
    var body: some View {
        BackgroundView {
            ScrollView {
                VStack(spacing: 18) {
                    ForEach(developers, id: \.self) { developer in
                        SettingsSection {
                            VStack {
                                HStack {
                                    Image(systemName: "person.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                        .foregroundStyle(.gray)
                                        .background(.blue)
                                        .clipShape(.rect(cornerRadius: 75))
                                        .shadow(
                                            color: .black.opacity(0.25),
                                            radius: 2,
                                            x: 0,
                                            y: 4
                                        )
                                    
                                    Text(developer)
                                        .font(Font.customFont(size: 28).weight(.semibold))
                                        .foregroundStyle(Colors.TextColors.primary)
                                    
                                    Spacer()
                                }
                            }
                            .padding(16)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Создатели игры")
                        .font(Font.customFont(size: 30).weight(.black))
                        .foregroundStyle(Colors.TextColors.primary)
                }
            }
        }
    }
}

#Preview {
    TeamView()
}
