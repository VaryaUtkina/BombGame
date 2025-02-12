//
//  MainView.swift
//  BombGame
//
//  Created by Варвара Уткина on 09.02.2025.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 255/255, green: 250/255, blue: 94/255)
                Image(.mainbackgroundShape)
                    .resizable()
                
                VStack(spacing: 70) {
                    VStack {
                        Text("ИГРА ДЛЯ КОМПАНИИ")
                            .font(Font.customFont(size: 28).weight(.black))
                        Text("БОМБА")
                            .font(Font.customFont(size: 48).weight(.black))
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .foregroundStyle(Colors.TextColors.primary)
                    
                    Image(.mainbomb)
                        .resizable()
                        .frame(width: 274, height: 300)
                    
                    VStack {
                        NavigationLink(destination: GameViewStart()) {
                            ButtonView(text: "Старт игры")
                        }
                        
                        //TODOO
                        NavigationLink(destination: EmptyView()) {
                            ButtonView(text: "Категории")
                        }
                    }
                    .padding(.horizontal, 23)
                }
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    MainView()
}

struct ButtonView: View {
    var text: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .fill(.mainSheetBg)
            .frame(height: 55)
            .overlay {
                Text(text)
                    .font(Font.customFont(size: 20).weight(.medium))
                    .foregroundStyle(Colors.TextColors.primary)
            }
         
    }
}
