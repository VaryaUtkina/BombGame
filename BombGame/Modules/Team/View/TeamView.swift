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
                ForEach(developers, id: \.self) { developer in
                    VStack {
                        HStack {
                            Image(systemName: "person.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 150, height: 150)
                                .foregroundStyle(.gray)
                                .background(.blue)
                                .clipShape(.rect(cornerRadius: 75))
                                .shadow(color: Colors.TextColors.primary, radius: 10)
                            
                            Text(developer)
                                .font(Font.customFont(size: 28).weight(.semibold))
                                .foregroundStyle(Colors.TextColors.primary)
                            
                            Spacer()
                        }
                        
                        Rectangle()
                            .frame(height: 2)
                            .foregroundStyle(Colors.ComponentsColors.gameViewButton)
                    }
                    .padding(.horizontal, 16)
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
