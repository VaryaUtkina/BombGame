//
//  RulesView.swift
//  BombGame
//
//  Created by Sergey Zakurakin on 2/12/25.
//

import SwiftUI

struct RulesView: View {
    @StateObject var viewModel = RulesViewModel()
    
    var body: some View {
        
        ZStack {
            Color.mainBackground
                .ignoresSafeArea()
            Image(.mainbackgroundShape)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Spacer()
                TitleTextView(topText: "Игра для компании",
                              bottomText: "Бомба")
                .padding(.horizontal, 20)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundStyle(.categoryCellBg)
                        .frame(height: 640)
                    
                    Image(.mainbackgroundShape)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 640)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .opacity(0.3)
                    
                    VStack(spacing: 10) {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 68 ,height: 3)
                        
                        Text("Правила игры")
                            .font(Font.customFont(size: 32).weight(.heavy))
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.5)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel.rules) { rule in
                                RuleView(rule: rule)
                            }
                        }
                        .padding(.horizontal, 20)
//                        .padding(.bottom, 25)
                        
                    }
                    .padding(.horizontal, 10)
                }
                .padding(.top, 10)
            }
        }
    }
}

#Preview {
    RulesView()
}
