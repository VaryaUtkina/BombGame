//
//  OwnQuestionView.swift
//  BombGame
//
//  Created by nikita on 25.02.25.
//

import SwiftUI

struct OwnQuestionView: View {
    let text: String
    let onDelete: () -> Void
    
    init(text: String, onDelete: @escaping () -> Void) {
        self.text = text
        self.onDelete = onDelete
    }
    
    var body: some View {
        ZStack {
            HStack {
                Text(text)
                    .font(Font.customFont(size: 20).weight(.medium))
                    .foregroundStyle(Color.primaryText)
                    .padding(16)
                
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(Color.categoryCellBg)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.primaryText, lineWidth: 1)
            )
            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
            
            
            VStack {
                HStack {
                    Spacer()
                    
                    Button(action: onDelete) {
                        Image(systemName: "xmark.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.gameViewButton)
                            .background(Color.primaryText)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    .frame(width: 20, height: 20)
                }
                
                Spacer()
            }
        }
        
    }
}

#Preview {
    OwnQuestionView(
        text: "Привет! Это текст необходимой длины чтобы поместиться на трёх строчках",
        onDelete: { print("была нажата кнопка") }
    )
}
