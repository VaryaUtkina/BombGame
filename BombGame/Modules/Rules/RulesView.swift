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
            Image(.mainbackgroundShape)
                .resizable()
            
            VStack {
                Spacer()
                TitleTextView(topText: "Игра для компании",
                              bottomText: "Бомба")
                
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .frame(height: 600)
                        .foregroundStyle(.categoryCellBg)
                    
                    Image(.mainbackgroundShape)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 600)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
                        .opacity(0.5)
                    
                    VStack(spacing: 10) {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 68 ,height: 3)
                        Text("Правила игры")
                            .font(Font.customFont(size: 32).weight(.heavy))
                            .frame(maxWidth: .infinity)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel.rules) { rule in
                                HStack(spacing: 10) {
                                    Circle()
                                        .frame(width: 29, height: 29)
                                        .foregroundColor(.categorySheetBg)
                                        .overlay {
                                            Text(rule.number)
                                                .font(Font.customFont(size: 16).weight(.heavy))
                                        }
                                    Text(rule.text)
                                        .font(Font.customFont(size: 20).weight(.medium))
                                        
                                }
                                if rule.showRectangle {
                                    HStack {
                                        RoundedRectangle(cornerRadius: 8)
                                            .frame(width: 167, height: 27)
                                            .foregroundColor(Color.gray)
                                            .overlay {
                                                Text("Start")
                                            }
                                    }
                                    .frame(maxWidth: .infinity)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 30)
                    .font(Font.customFont(size: 20).weight(.medium))
                    
                    Spacer()
                }
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RulesView()
}
