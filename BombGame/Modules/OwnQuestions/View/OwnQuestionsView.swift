//
//  OwnQuestionsView.swift
//  BombGame
//
//  Created by nikita on 23.02.25.
//

import SwiftUI

struct OwnQuestionsView: View {
    @Environment(\.dismiss) var dismiss
    @FocusState private var fieldIsFocused: Bool
    @StateObject private var viewModel = OwnQuestionsViewModel()
    
    var body: some View {
        BackgroundView {
            ScrollView {
                ForEach(viewModel.questions, id: \.self) { question in
                    ZStack {
                        HStack {
                            Text(question)
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
                        .padding(.horizontal, 18)
                        .padding(.vertical, 4)
                        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        
                        VStack {
                            HStack {
                                Spacer()
                                
                                Button(action: {
                                    withAnimation {
                                        viewModel.deleteQuestion(question)
                                    }
                                }) {
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
                            .padding(.horizontal, 18)
                            
                            Spacer()
                        }
                    }
                }
            }
            
            HStack {
                ZStack {
                    TextField(
                        "Введите вопрос",
                        text: $viewModel.inputText
                    )
                    .font(Font.customFont(size: 20).weight(.medium))
                    .foregroundStyle(Color.primaryText)
                    .padding(8)
                    .submitLabel(.done)
                    .focused($fieldIsFocused)
                    .onSubmit {
                        viewModel.saveQuestion()
                        fieldIsFocused = false
                        
                    }
                    .onChange(of: viewModel.inputText) { newValue in
                        if newValue.count > viewModel.maximumInputTextCount {
                            viewModel.inputText = String(
                                newValue.prefix(viewModel.maximumInputTextCount)
                            )
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
                
                Text("\(viewModel.inputText.count) / \(viewModel.maximumInputTextCount)")
                    .font(Font.customFont(size: 14).weight(.thin))
                    .foregroundStyle(Color.primaryText)
                    .lineLimit(1)
                    .frame(width: 60, alignment: .trailing)
            }
            .padding(.horizontal, 16)
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
                Text("Собственные вопросы")
                    .font(Font.customFont(size: 30).weight(.black))
                    .foregroundStyle(Color.primaryText)
                    .minimumScaleFactor(0.3)
            }
        }
        
    }
}

#Preview {
    OwnQuestionsView()
}
