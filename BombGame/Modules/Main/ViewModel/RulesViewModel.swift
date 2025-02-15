//
//  RulesViewModel.swift
//  BombGame
//
//  Created by Sergey Zakurakin on 2/13/25.
//

import SwiftUI

final class RulesViewModel: ObservableObject {
    
    @Published var rules: [RuleModel] = [
        RuleModel(number: "1", text: "Все игроки становятся в круг.", showRectangle: false),
        RuleModel(number: "2", text: "Первый игрок берет телефон и нажимает кнопку:", showRectangle: true),
        RuleModel(number: "3", text: "На экране появляется вопрос “Назовите Фрукт”.", showRectangle: false),
        RuleModel(number: "4", text: "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.", showRectangle: false),
        RuleModel(number: "5", text: "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.", showRectangle: false),
        RuleModel(number: "6", text: "Проигравшим считается тот, в чьих руках взорвалась бомба.", showRectangle: false),
        RuleModel(number: "7", text: "Если выбран режим игры “С Заданиями”, то проигравший выполняет задание.", showRectangle: false)
    ]
    
}
