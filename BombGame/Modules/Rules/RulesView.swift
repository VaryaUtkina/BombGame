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
            
            VStack {
                Spacer()
                TitleTextView(topText: "Игра для компании",
                              bottomText: "Бомба")
                .padding(.horizontal, 20)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 40)
                        .foregroundStyle(.categoryCellBg)
                    //
                        .frame(height: 600)
                    
                    Image(.mainbackgroundShape)
                        .resizable()
                        .scaledToFill()
                        .frame(height: 600)
                        .clipShape(RoundedRectangle(cornerRadius: 40))
//                        .padding(.horizontal, 20)
                        .opacity(0.5)
                    
                    VStack(spacing: 10) {
                        RoundedRectangle(cornerRadius: 25)
                            .frame(width: 68 ,height: 3)
                            
                        Text("Правила игры")
                            .font(Font.customFont(size: 32).weight(.heavy))
                            .multilineTextAlignment(.center)
                            .minimumScaleFactor(0.5)
                        
                        VStack(alignment: .leading, spacing: 10) {
                            ForEach(viewModel.rules) { rule in
                                HStack(spacing: 10) {
                                    Circle()
                                        .frame(width: 29, height: 29)
                                        .foregroundColor(.categorySheetBg)
                                        .overlay {
                                            Text(rule.number)
                                                .font(Font.customFont(size: 16).weight(.heavy))
                                                .foregroundColor(.primary)
                                        }
                                    Text(makeAttributedString(from: rule.text))
                                        .font(Font.customFont(size: 20).weight(.medium))
                                        .multilineTextAlignment(.leading)
                                        .minimumScaleFactor(0.8)
                                        .layoutPriority(1)
                                    
                                }
                                if rule.showRectangle {
                                    HStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 167, height: 27)
                                            .foregroundStyle(.categoryCellBg)
                                            .shadow(radius: 5)
                                            .overlay {
                                                Text("Старт игры")
                                                    .font(Font.customFont(size: 12).weight(.regular))
                                                    
                                            }
                                    }
                                    .padding(.horizontal, 20)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                        
                    }
                    .padding(.horizontal, 10)
                    
                   
                }
                
            }
        }
       
    }
    // Функция для выделения текста фиолетовым цветом
       func makeAttributedString(from text: String) -> AttributedString {
           var attributedString = AttributedString(text)
           if let range = attributedString.range(of: "С Заданиями") {
               attributedString[range].foregroundColor = .purple
           }
           return attributedString
    }
}

#Preview {
    RulesView()
}
