//
//  TeamModel.swift
//  BombGame
//
//  Created by Варвара Уткина on 23.02.2025.
//

import Foundation

struct TeamModel {
    let text: TeamTexts
    let developers: [Developer]
    
    init() {
        text = TeamTexts()
        developers = [
            Developer(
                name: "Варя",
                role: "Хранительница порядка (тимлид)",
                image: "varya",
                description: "Собрала разработчиков в одну команду, чтобы вы играли, взрывали, смеялись!",
                gitHub: "https://github.com/VaryaUtkina"
            ),
            Developer(
                name: "Дима",
                role: "Главный чародей",
                image: "dima",
                description: "Звуки, анимации, таймер... Все самое сложное сделано им!",
                gitHub: "https://github.com/DmitryLorents"
            ),
            Developer(
                name: "Никита",
                role: "Маг по настройкам",
                image: "nikita",
                description: "Категории с вопросами и вся логика игры держится на нём!",
                gitHub: "https://github.com/nikmosyl"
            ),
            Developer(
                name: "Серёжа",
                role: "Волшебник правил",
                image: "sergey",
                description: "Стартовый экран и правила игры сделаны его руками",
                gitHub: "https://github.com/SergeyZakurakin"
            )
        ]
    }
}
