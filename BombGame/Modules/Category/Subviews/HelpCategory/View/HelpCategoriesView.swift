//
//  HelpCategoryView.swift
//  BombGame
//
//  Created by nikita on 13.02.25.
//

import SwiftUI

struct HelpCategoriesView: View {
    private let helpCategoriesViewModel = HelpCategoriesViewModel()
    
    private var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 23),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Colors.ComponentsColors.gameBackground
                .ignoresSafeArea()
            
            CurvedShape()
                .ignoresSafeArea()
                .foregroundStyle(Color.curvedShapeHelp)
                .background(Color.categorySheetBg)
            
            VStack() {
                RoundedRectangle(cornerRadius: 1.5)
                    .fill(Color.primaryText)
                    .frame(width: 68, height: 3)
                    .padding(.top, 18)
                
                Text("Правила игры")
                    .font(Font.customFont(size: 30).weight(.black))
                    .foregroundStyle(Color.primaryText)
                    .padding(.top, 6)
                
                Text("В игре доступно более 6 категорий и более 90 вопросов")
                    .font(Font.customFont(size: 24).weight(.black))
                    .foregroundStyle(Color.primaryText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 32)
                    .padding(.top, 12)
                
                Text("Можно выбрать сразу несколько категорий для игры.")
                    .font(Font.customFont(size: 24).weight(.regular))
                    .foregroundStyle(Color.primaryText)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 42)
                    .padding(.top, 18)
                
                LazyVGrid(columns: columns, spacing: 34) {
                    ForEach(helpCategoriesViewModel.categories[..<min(4, helpCategoriesViewModel.categories.count)]) { category in
                        CategoryView(category: category, blind: true)
                            .frame(height: 150)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                            .disabled(true)
                    }
                }
                .padding(.horizontal, 24)
                .padding(.top, 12)
            }
            
        }
        
    }
}

#Preview {
    HelpCategoriesView()
}
