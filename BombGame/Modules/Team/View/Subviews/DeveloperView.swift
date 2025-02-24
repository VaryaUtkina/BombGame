//
//  DeveloperView.swift
//  BombGame
//
//  Created by Варвара Уткина on 24.02.2025.
//

import SwiftUI

struct DeveloperView: View {
    let developer: Developer
    
    var body: some View {
        SettingsSection {
            VStack {
                HStack(spacing: 18) {
                    Image(developer.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 130, height: 130)
                        .foregroundStyle(.gray)
                        .background(.blue)
                        .clipShape(.rect(cornerRadius: 75))
                        .shadow(
                            color: .black.opacity(0.25),
                            radius: 2,
                            x: 0,
                            y: 4
                        )
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text(developer.name)
                            .font(Font.customFont(size: 28).weight(.semibold))
                            .foregroundStyle(Colors.TextColors.primary)
                        
                        Text(developer.role)
                            .font(Font.customFont(size: 16).weight(.semibold))
                            .foregroundStyle(Colors.TextColors.primary)
                    }
                    
                    Spacer()
                }
                
                VStack(spacing: 8) {
                    HStack {
                        Text(developer.description)
                            .font(Font.customFont(size: 14).weight(.semibold))
                            .foregroundStyle(Colors.TextColors.primary)
                            .multilineTextAlignment(.leading)
                            .padding(.top, 8)
                        
                        Spacer()
                    }
                    
                    if let url = URL(string: developer.gitHub) {
                        Link(destination: url) {
                            Text(developer.gitHub)
                                .font(Font.customFont(size: 14).weight(.semibold))
                                .foregroundStyle(Colors.ComponentsColors.mainBackground)
                                .shadow(color: .black, radius: 0.5)
                                .shadow(color: .black, radius: 0.5)
                                .shadow(color: .black, radius: 0.5)
                                .shadow(color: .black, radius: 0.5)
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                
                
            }
            .padding(16)
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    DeveloperView(developer: TeamModel().developers.first!)
}
