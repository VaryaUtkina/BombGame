//
//  OwnQuestionsView.swift
//  BombGame
//
//  Created by nikita on 23.02.25.
//

import SwiftUI

struct OwnQuestionsView: View {
    @Environment(\.dismiss) var dismiss
    
    private let viewModel = OwnQuestionsViewModel()
    
    var body: some View {
        VStack {
            List(viewModel.manager.gameData.ownQuestions, id: \.self) { question in
                Text(question)
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
