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
                        .padding(.bottom, 25)
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 10)
                }
//            }
        
       
    }
}

#Preview {
    RulesView()
}
