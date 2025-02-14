//
//  CategoryView.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import SwiftUI

struct CategoryView: View {
    @StateObject private var categoryViewModel: CategoryViewModel
    
    var body: some View {
        Button(action: categoryViewModel.toggleActive) {
            ZStack {
                VStack {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.primaryText)
                            .opacity(categoryViewModel.showCheckmark ? 1 : 0)
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack {
                    Image(categoryViewModel.category.imageName)
                        .resizable()
                        .scaledToFit()
                    Text(categoryViewModel.category.title)
                        .font(Font.customFont(size: 16).weight(.black))
                        .foregroundStyle(Color.primaryText)
                }
            }
            .padding(8)
        }
        .background(categoryViewModel.isActive ? Color.selectedCellBg : Color.categoryCellBg)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 1)
        )
        
    }
    
    init(category: Category, isBlind: Bool = false) {
        _categoryViewModel = StateObject(
            wrappedValue: CategoryViewModel(
                category: category,
                isBlind: isBlind
            )
        )
    }
}
