//
//  Question.swift
//  MillionaireApp
//
//  Created by Никита Ясеник on 08.02.2023.
//

import Foundation

enum QuestionComplexity {
    case easy
    case medium
    case hard
}

struct QuestionModel {
    
    private(set) var allQuestions: [Question] = [
        Question(questionText: "Сколько морей омывают Балканский полуостров?",
                 answers: ["3", "4", "5", "6"],
                 trueAnswer: "6",
                 complexity: .easy),
        Question(questionText: "Реки с каким названием нет на территории России?",
                 answers: ["Спина", "Уста", "Палец", "Шея"],
                 trueAnswer: "Спина",
                 complexity: .easy),
        Question(questionText: "Кто был первым военным министром Российской империи?",
                 answers: ["Аракчеев", "Барклай-де-Толли", "Вязмитинов", "Коновницын"],
                 trueAnswer: "Вязмитинов",
                 complexity: .easy),
        Question(questionText: "Что Шекспир назвал «вкуснейшим из блюд в земном пиру»?",
                 answers: ["Опьянение", "Любовь", "Уединение", "Сон"],
                 trueAnswer: "Сон",
                 complexity: .easy),
        Question(questionText: "Кто из этих философов в 1864 году написал музыку на стихи А. С. Пушкина «Заклинание» и «Зимний вечер»?",
                 answers: ["Юнг", "Ницше", "Шопенгауэр", "Гегель"],
                 trueAnswer: "Ницше",
                 complexity: .easy),
        Question(questionText: "С какой фигуры начинаются соревнования по городошному спорту?",
                 answers: ["Часовые", "Артиллерия", "Пушка", "Пулеметное гнездо"],
                 trueAnswer: "Пушка",
                 complexity: .medium),
        Question(questionText: "Сколько раз в сутки подзаводят куранты Спасской башни Кремля?",
                 answers: ["Один", "Два", "Три", "Четыре"],
                 trueAnswer: "Два",
                 complexity: .medium),
        Question(questionText: "Как назвали первую кимберлитовую трубку, открытую Ларисой Попугаевой 21 августа 1954 года?",
                 answers: ["<<Советская>>", "<<Зарница>>", "<<Удачная>>", "<<Мир>>"],
                 trueAnswer: "<<Зарница>>",
                 complexity: .medium),
        Question(questionText: "Что Иван Ефремов в романе «Лезвие бритвы» назвал наивысшей степенью целесообразности?",
                 answers: ["Красоту", "Мудрость", "Смерть", "Свободу"],
                 trueAnswer: "Красоту",
                 complexity: .medium),
        Question(questionText: "В какой из этих столиц бывших союзных республик раньше появилось метро?",
                 answers: ["Ереван", "Тбилиси", "Баку", "Минск"],
                 trueAnswer: "Тбилиси",
                 complexity: .medium),
        Question(questionText: "Кто 1-м получил Нобелевскую премию по литературе?",
                 answers: ["Поэт", "Романист", "Драматург", "Эссеист"],
                 trueAnswer: "Поэт",
                 complexity: .hard),
        Question(questionText: "Какой химический элемент назван в честь злого подземного гнома?",
                 answers: ["Гафний", "Кобальт", "Бериллий", "Теллур"],
                 trueAnswer: "Кобальт",
                 complexity: .hard),
        Question(questionText: "Что такое лобогрейка?",
                 answers: ["Жнейка", "Шапка", "Болезнь", "Печка"],
                 trueAnswer: "Жнейка",
                 complexity: .hard),
        Question(questionText: "Какой вид кавалерии предназначался для боевых действий как в конном, так и в пешем строю?",
                 answers: ["Кирасиры", "Уланы", "Драгуны", "Гусары"],
                 trueAnswer: "Драгуны",
                 complexity: .hard),
        Question(questionText: "В каком немецком городе родилась будущая императрица России Екатерина II?",
                 answers: ["Висбаден", "Цербст", "Штеттин", "Дармштадт"],
                 trueAnswer: "Штеттин",
                 complexity: .hard),
        
        
        
    ]
    
    struct Question {
        var questionText: String
        var answers: [String]
        var trueAnswer: String
        var complexity: QuestionComplexity
        
        init(questionText: String,
             answers: [String],
             trueAnswer: String,
             complexity: QuestionComplexity) {
            self.questionText = questionText
            self.answers = answers
            self.trueAnswer = trueAnswer
            self.complexity = complexity
        }
    }
    
    func getRandomQuestions(complexity: QuestionComplexity) -> [QuestionModel.Question] {
        var questions: [Question] = []
        switch complexity {
        case .easy:
            for question in allQuestions {
                if question.complexity == .easy {
                    questions.append(question)
                }
            }
        case .medium:
            for question in allQuestions {
                if question.complexity == .medium {
                    questions.append(question)
                }
            }
        case .hard:
            for question in allQuestions {
                if question.complexity == .hard {
                    questions.append(question)
                }
            }
        }
        
        return questions
    }
    
}




