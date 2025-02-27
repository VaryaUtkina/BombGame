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
    @StateObject private var viewModel = OwnQuestionsViewModel(model: OwnQuestionsModel())
    
    var body: some View {
        ZStack {
            BackgroundView {
                VStack {
                    ScrollView {
                        VStack {
                            ForEach(viewModel.questions, id: \.self) { question in
                                OwnQuestionView(
                                    text: question,
                                    onDelete: {
                                        withAnimation { viewModel.deleteQuestion(question) }
                                    }
                                )
                                .padding(.top, 8)
                            }
                            .padding(.horizontal, 16)
                        }
                        .padding(.top, getTopPadding())
                        .padding(.bottom, 70)
                    }
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
                    Text(viewModel.model.texts.title)
                        .font(Font.customFont(size: 30).weight(.black))
                        .foregroundStyle(Color.primaryText)
                        .minimumScaleFactor(0.8)
                }
            }
            
            VStack {
                Spacer()
                
                OwnTextField(
                    text: $viewModel.inputText,
                    placeholder: viewModel.model.texts.placeholder,
                    maxCount: viewModel.maximumInputTextCount,
                    onSubmit: {
                        viewModel.saveQuestion()
                    }
                )
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    ZStack {
                        Colors.ComponentsColors.gameBackground
                            .ignoresSafeArea()
                        
                        CurvedShape()
                            .ignoresSafeArea()
                            .foregroundStyle(.curvedShape)
                    }
                )
            }
        }
    }
    
    private func getTopPadding() -> CGFloat {
        if #unavailable(iOS 18.0) {
            return 50
        }
        return 0
    }
}

#Preview {
    OwnQuestionsView()
}
