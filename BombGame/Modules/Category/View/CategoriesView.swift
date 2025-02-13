//
//  CategoryView.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import SwiftUI

struct CategoriesView: View {
    @Environment(\.dismiss) var dismiss
    
    let categories: [Category] = DataManager.shared.getAllCategories()
    
    var columns: [GridItem] = [
        GridItem(.flexible(), spacing: 23),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Image("CategoryBackground")
                .resizable()
                .ignoresSafeArea(edges: .all)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 34) {
                    ForEach(categories) { category in
                        CategoryView(category: category)
                            .frame(height: 150)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    }
                }
                .padding(23)
            }
            
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
                Text("Категории")
                    .font(Font.customFont(size: 30).weight(.black))
                    .foregroundStyle(Colors.TextColors.primary)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Image(systemName: "questionmark.circle.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundStyle(Color.categorySheetBg)
            }
        }
    }
}


#Preview {
    CategoriesView()
}
