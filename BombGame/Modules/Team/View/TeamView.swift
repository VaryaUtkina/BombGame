//
//  TeamView.swift
//  BombGame
//
//  Created by Варвара Уткина on 23.02.2025.
//

import SwiftUI

struct TeamView: View {
    @StateObject private var viewModel = TeamViewModel(model: TeamModel())
    
    var body: some View {
        BackgroundView {
            VStack {
                RoundedRectangle(cornerRadius: 1.5)
                    .fill(Colors.TextColors.primary)
                    .frame(width: 68, height: 3)
                    .padding(.top, 18)
                
                ScrollView {
                    VStack(spacing: 18) {
                        Text(viewModel.model.text.navTitle)
                            .font(Font.customFont(size: 30).weight(.black))
                            .foregroundStyle(Colors.TextColors.primary)
                        
                        descriptionSection
                        
                        ForEach(
                            viewModel.model.developers,
                            id: \.name
                        ) { developer in
                            DeveloperView(developer: developer)
                        }
                    }
                    .padding(.horizontal, 18)
                }
            }
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(viewModel.model.text.description)
                    .font(Font.customFont(size: 18).weight(.semibold))
                    .foregroundStyle(Colors.TextColors.primary)
                
                Spacer()
            }
            
            if let url = URL(string: viewModel.model.text.link) {
                Link(destination: url) {
                    Text(viewModel.model.text.linkText)
                        .font(Font.customFont(size: 18).weight(.semibold))
                        .foregroundStyle(Colors.ComponentsColors.mainBackground)
                        .shadow(color: .black, radius: 0.5)
                        .shadow(color: .black, radius: 0.5)
                        .shadow(color: .black, radius: 0.5)
                        .shadow(color: .black, radius: 0.5)
                }
            }
        }
    }
}

#Preview {
    TeamView()
}
