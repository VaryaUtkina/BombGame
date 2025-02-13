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
                    
                    VStack(spacing: 10) {
                        Text("Правила игры")
                            .font(.title)
                        Text("Все игроки становятся в круг.")
                        Text("Первый игрок берет телефон и нажимает кнопку:")
                        Text("На экране появляется вопрос “Назовите Фрукт”.")
                        Text("Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.")
                        Text("Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.")
                        Text("Проигравшим считается тот, в чьих руках взорвалась бомба.")
                        Text("Если выбран режим игры “С Заданиями”, то проигравший выполняет задание.")
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
