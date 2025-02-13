//
//  CategoryView.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import SwiftUI

struct CategoryView: View {
    @StateObject private var categoryVM: CategoryViewModel
    
    var body: some View {
        Button(action: categoryVM.toggleActive) {
            ZStack {
                VStack {
                    HStack {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color.primaryText)
                            .opacity(categoryVM.showCheckmark ? 1 : 0)
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack {
                    Image(categoryVM.category.imageName)
                        .resizable()
                        .scaledToFit()
                    Text(categoryVM.category.title)
                        .font(Font.customFont(size: 16).weight(.black))
                        .foregroundStyle(Color.primaryText)
                }
            }
            .padding(8)
        }
        .background(categoryVM.isActive ? Color.selectedCellBg : Color.categoryCellBg)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 1)
        )
        
    }
    
    init(category: Category, blind: Bool = false) {
        _categoryVM = StateObject(
            wrappedValue: CategoryViewModel(
                category: category,
                blind: blind
            )
        )
    }
}
