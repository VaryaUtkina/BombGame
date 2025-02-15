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
        ZStack {
            RoundedRectangle(cornerRadius: 40)
                .foregroundStyle(.categoryCellBg)
                .ignoresSafeArea()
            
            Image(.mainbackgroundShape)
                .resizable()
                .scaledToFill()
                .clipShape(RoundedRectangle(cornerRadius: 40))
                .opacity(0.3)
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                RoundedRectangle(cornerRadius: 1.5)
                    .fill(Color.primaryText)
                    .frame(width: 68, height: 3)
                    .padding(.top, 18)
                
                Text(viewModel.title)
                    .font(Font.customFont(size: 32).weight(.black))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                
                VStack(alignment: .leading, spacing: 10) {
                    ForEach(viewModel.rules) { rule in
                        RuleTextView(rule: rule)
                    }
                }
                .padding(.horizontal, 20)
            }
            .padding(.horizontal, 10)
        }
    }
}

#Preview {
    RulesView()
}
