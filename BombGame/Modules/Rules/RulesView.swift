//
//  RulesView.swift
//  BombGame
//
//  Created by Sergey Zakurakin on 2/12/25.
//

import SwiftUI

struct RulesView: View {
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
                    
                    VStack {
                        Text("1")
                        Text("1")
                        Text("1")
                        Text("1")
                        Text("1")
                    }
                }
                    
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    RulesView()
}
