//
//  CategoryView.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import SwiftUI

struct CategoriesView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var viewModel = CategoriesViewModel()
    @State private var shouldNavigateToOwnCategory = false
    
    private let columns: [GridItem] = [
        GridItem(.flexible(), spacing: 23),
        GridItem(.flexible())
    ]
    
    var body: some View {
        BackgroundView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.categories) { category in
                        CategoryView(
                            category: category,
                            navigateToOwnCategory: $shouldNavigateToOwnCategory
                        )
                        .frame(height: 150)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        .padding(.bottom, 16)
                        .padding(.top, getTopPadding(for: category))
                    }
                }
                .padding(.horizontal, 23)
            }
            .navigationDestination(isPresented: $shouldNavigateToOwnCategory) {
                OwnQuestionsView()
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
                    .foregroundStyle(Color.primaryText)
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: viewModel.toggleHelp) {
                    Image(systemName: "questionmark.circle.fill")
                        .resizable()
                        .frame(width: 35, height: 35)
                        .foregroundStyle(Color.categorySheetBg)
                }
                .sheet(isPresented: $viewModel.isHelpPresented) {
                    HelpCategoriesView()
                        .presentationDetents([.fraction(0.87)])
                }
            }
        }
    }
    
    private func getTopPadding(for category: Category) -> CGFloat {
        if #unavailable(iOS 18.0), (category.id == .movie || category.id == .sport) {
            return 50
        }
        return 0
    }
}


#Preview {
    CategoriesView()
}
