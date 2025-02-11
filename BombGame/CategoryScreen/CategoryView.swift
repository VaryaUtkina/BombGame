//
//  CategoryView.swift
//  BombGame
//
//  Created by nikita on 11.02.25.
//

import SwiftUI

struct CategoryView: View {
    let category: Category
    
    var checkMarkIsHidden: Bool
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .opacity(checkMarkIsHidden ? 0 : 1)
                    Spacer()
                }
                Spacer()
            }
            
            VStack {
                Image("CategoryMiscellaneous")
                    .resizable()
                    .scaledToFit()
                Text(category.title)
                    .font(Font.customFont(size: 16).weight(.black))
                    .foregroundStyle(Colors.TextColors.primary)
            }
            
        }
        .padding(8)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 1)
        )
        
    }
}

#Preview {
    CategoryView(category: Category.getTests()[0], checkMarkIsHidden: false)
}
