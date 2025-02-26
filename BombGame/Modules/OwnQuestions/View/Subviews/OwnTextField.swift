//
//  OwnTextField.swift
//  BombGame
//
//  Created by nikita on 25.02.25.
//

import SwiftUI

struct OwnTextField: View {
    @Binding var text: String
    @FocusState private var fieldIsFocused: Bool
    let placeholder: String
    let maxCount: Int
    let onSubmit: () -> Void
    
    var body: some View {
        HStack {
            ZStack {
                TextField(placeholder, text: $text)
                    .font(Font.customFont(size: 20).weight(.medium))
                    .foregroundStyle(Color.primaryText)
                    .padding(8)
                    .submitLabel(.done)
                    .focused($fieldIsFocused)
                    .onSubmit {
                        onSubmit()
                        fieldIsFocused = false
                    }
                    .onChange(of: text) { newValue in
                        if newValue.count > maxCount {
                            text = String(newValue.prefix(maxCount))
                        }
                    }
            }
            .background(Color.gameViewButton)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(lineWidth: 1)
                    .foregroundStyle(Color.primaryText)
            )
            
            Text("\(text.count) / \(maxCount)")
                .font(Font.customFont(size: 14).weight(.thin))
                .foregroundStyle(Color.primaryText)
                .lineLimit(1)
                .frame(width: 60, alignment: .trailing)
        }
    }
}

#Preview {
    OwnTextField(
        text: .constant("Какой-то текст"),
        placeholder: "Введите текст",
        maxCount: 150,
        onSubmit: {
            print("onSubmit")
        }
    )
}
