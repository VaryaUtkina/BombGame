//
//  Rules.swift
//  BombGame
//
//  Created by lorenc_D_K on 15.02.2025.
//

import Foundation

struct Rules {
    let rules: [Rule]
    
    init() {
        rules =
        [
            Rule(number: "1", text: "Все игроки становятся в круг.", shouldShowRectangle: false),
            Rule(number: "2", text: "Первый игрок берет телефон и нажимает кнопку:", shouldShowRectangle: true),
            Rule(number: "3", text: "На экране появляется вопрос “Назовите Фрукт”.", shouldShowRectangle: false),
            Rule(number: "4", text: "Игрок отвечает на вопрос и после правильного ответа передает телефон следующему игроку.", shouldShowRectangle: false),
            Rule(number: "5", text: "Игроки по кругу отвечают на один и тот же вопрос до тех пор, пока не взорвется бомба.", shouldShowRectangle: false),
            Rule(number: "6", text: "Проигравшим считается тот, в чьих руках взорвалась бомба.", shouldShowRectangle: false),
            Rule(number: "7", text: "Если выбран режим игры “С Заданиями”, то проигравший выполняет задание.", shouldShowRectangle: false)
        ]
    }
}
