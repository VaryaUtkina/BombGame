//
//  CategoryView.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import SwiftUI

struct CategoryView: View {
    @StateObject private var viewModel: CategoryViewModel
    @Binding var shouldNavigateToOwnCategory: Bool
    
    var body: some View {
        Button(action: {
            viewModel.toggleActive()
            shouldNavigateToOwnCategory = viewModel.navigateToOwnCategory
        }) {
            ZStack {
                VStack {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.primaryText)
                            .opacity(viewModel.showCheckmark ? 1 : 0)
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack {
                    Image(viewModel.category.imageName)
                        .resizable()
                        .scaledToFit()
                    Text(viewModel.category.title)
                        .font(Font.customFont(size: 16).weight(.black))
                        .foregroundStyle(Color.primaryText)
                }
            }
            .padding(8)
        }
        .background(viewModel.isActive ? Color.selectedCellBg : Color.categoryCellBg)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 1)
        )
        
    }
    
    init(
        category: Category,
        isBlind: Bool = false,
        navigateToOwnCategory: Binding<Bool> = .constant(false)
    ) {
        _viewModel = StateObject(
            wrappedValue: CategoryViewModel(
                category: category,
                isBlind: isBlind
            )
        )
        _shouldNavigateToOwnCategory = navigateToOwnCategory
    }
}
