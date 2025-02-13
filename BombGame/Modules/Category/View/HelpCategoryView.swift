//
//  HelpCategoryView.swift
//  BombGame
//
//  Created by nikita on 13.02.25.
//

import SwiftUI

struct HelpCategoryView: View {
    
    private let categories: [Category] = CategoriesManager.shared.getAllCategories()
    
    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 23),
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Правила игры")
                .font(Font.customFont(size: 30).weight(.black))
                .foregroundStyle(Color.primaryText)
            Text("В игре доступно более 6 категорий и более 90 вопросов")
                .font(Font.customFont(size: 24).weight(.black))
                .foregroundStyle(Color.primaryText)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 32)
            Text("Можно выбрать сразу несколько категорий для игры.")
                .font(Font.customFont(size: 24).weight(.regular))
                .foregroundStyle(Color.primaryText)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 42)
            
            LazyVGrid(columns: columns, spacing: 34) {
                ForEach(categories[..<min(4, categories.count)]) { category in
                    CategoryView(category: category)
                        .frame(height: 150)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                }
            }
            .padding(23)
            
            Spacer()
        }
    }
}

#Preview {
    HelpCategoryView()
}
