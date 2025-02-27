//
//  RulesView.swift
//  BombGame
//
//  Created by Sergey Zakurakin on 2/12/25.
//

import SwiftUI

struct RulesView: View {
    @StateObject var viewModel = RulesViewModel(model: Rules())
    
    var body: some View {
        BackgroundView {
            VStack {
                RoundedRectangle(cornerRadius: 1.5)
                    .fill(Color.primaryText)
                    .frame(width: 68, height: 3)
                    .padding(.top, 18)
                
                ScrollView {
                    VStack(spacing: 10) {
                        
                        Text(viewModel.title)
                            .font(Font.customFont(size: 32).weight(.black))
                            .foregroundStyle(Color.primaryText)
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.5)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel.rules) { rule in
                                RuleTextView(rule: rule)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 40)
                    }
                    .padding(.horizontal, 10)
                }
                .scrollIndicators(.hidden)
                .frame(maxHeight: UIScreen.main.bounds.height * 0.70)
            }
        }
    }
}

#Preview {
    RulesView()
}
