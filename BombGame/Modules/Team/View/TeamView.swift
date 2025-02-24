//
//  TeamView.swift
//  BombGame
//
//  Created by Варвара Уткина on 23.02.2025.
//

import SwiftUI

struct TeamView: View {
    @StateObject private var viewModel = TeamViewModel(
        model: TeamModel(),
        dataManager: DataManager.shared
    )
    
    var body: some View {
        BackgroundView {
            VStack {
                RoundedRectangle(cornerRadius: 1.5)
                    .fill(Color.primaryText)
                    .frame(width: 68, height: 3)
                    .padding(.top, 18)
                
                ScrollView {
                    VStack(spacing: 18) {
                        Text(viewModel.model.text.navTitle)
                            .font(Font.customFont(size: 30).weight(.black))
                            .foregroundStyle(Colors.TextColors.primary)
                        
                        descriptionSection
                        
                        ForEach(viewModel.developers, id: \.name) { developer in
                            DeveloperCard(developer: developer)
                        }
                    }
                }
            }
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(viewModel.description)
                    .font(Font.customFont(size: 18).weight(.semibold))
                    .foregroundStyle(Colors.TextColors.primary)
                
                Spacer()
            }
            
            if let url = URL(string: viewModel.link) {
                Link(viewModel.linkText, destination: url)
                    .font(Font.customFont(size: 18).weight(.semibold))
                    .foregroundStyle(.blue)
            }
        }
        .padding(.horizontal, 16)
    }
}

struct DeveloperCard: View {
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
                
                Text(developer.description)
                    .font(Font.customFont(size: 14).weight(.semibold))
                    .foregroundStyle(Colors.TextColors.primary)
                    .multilineTextAlignment(.leading)
                    .padding(.top, 8)
            }
            .padding(16)
        }
        .padding(.bottom, 16)
    }
}

#Preview {
    TeamView()
}
