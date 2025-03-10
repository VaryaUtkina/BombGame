//
//  RuleTextView.swift
//  BombGame
//
//  Created by Sergey Zakurakin on 2/14/25.
//

import SwiftUI

struct RuleTextView: View {
    let rule: Rule
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Circle()
                    .frame(width: 29, height: 29)
                    .foregroundColor(.categorySheetBg)
                    .overlay {
                        Text(rule.number)
                            .font(Font.customFont(size: 16).weight(.heavy))
                            .foregroundColor(.primary)
                    }
                
                Text(rule.attributedText)
                    .font(Font.customFont(size: 20).weight(.medium))
                    .foregroundStyle(Color.primaryText)
                    .multilineTextAlignment(.leading)
                    .minimumScaleFactor(0.8)
                    .layoutPriority(1)
            }
            
            if rule.shouldShowRectangle {
                HStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 167, height: 27)
                        .foregroundStyle(.categoryCellBg)
                        .shadow(radius: 5)
                        .overlay {
                            Text("Старт игры")
                                .font(Font.customFont(size: 12).weight(.regular))
                                .foregroundStyle(Color.primaryText)
                        }
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 20)
            }
        }
    }
}

#Preview {
    RuleTextView(rule: Rule.init(number: "1", text: "text", shouldShowRectangle: false))
}
