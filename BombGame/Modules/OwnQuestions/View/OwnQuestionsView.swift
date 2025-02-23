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
        Text("TEST")
        List(viewModel.manager.gameData.ownQuestions, id: \.self) { question in
            Text(question)
        }
        
    }
}

#Preview {
    OwnQuestionsView()
}
