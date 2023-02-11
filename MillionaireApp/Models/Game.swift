//
//  Game.swift
//  MillionaireApp
//
//  Created by Никита Ясеник on 08.02.2023.
//

import Foundation

struct GameModel {
    
    private(set) var games = [Game]()
    
    struct Game: Identifiable {
        var id: Int
        var player: Player?
        var questions: [QuestionModel.Question]
        var hints: [Hint]
        var sumForQuestion: [Int: Int]
        var totalSum: Int
        var totalFireProofSum: Int
        var fireProofSums: [Int]
        
        
        init(id: Int,
             player: Player? = nil,
             questions: [QuestionModel.Question],
             hints: [Hint],
             sumForQuestion: [Int: Int] = sumsForQuestions,
             totalSum: Int = 0,
             totalFireProofSum: Int = 0,
             fireProofSums: [Int] = [1_000, 32_000, 1_000_000]
        ) {
            self.id = id
            self.player = player
            self.questions = questions
            self.hints = hints
            self.sumForQuestion = sumForQuestion
            self.totalSum = totalSum
            self.totalFireProofSum = totalFireProofSum
            self.fireProofSums = fireProofSums
        }
        
        mutating func setTotalPrice(price: Int) {
            self.totalSum = price
            for sum in self.fireProofSums {
                if price == sum {
                    self.totalFireProofSum = sum
                }
            }
        }
        
        func getTotalFireProofSum() -> Int {
            return self.totalFireProofSum
        }

    }
    
    init() {}
    private var uniqueGameId = 0
    
    mutating func createGame(player: Player?, hints: [Hint]) -> Game {
        uniqueGameId += 1
        let currentQuestions = generateQuestions()
        let game = Game(id: uniqueGameId,
                        questions: currentQuestions,
                        hints: hints
        )
        games.append(game)
        return game
    }
    
    func generateQuestions() -> [QuestionModel.Question] {
        var questions: [QuestionModel.Question] = []
        let questionModel = QuestionModel()
        questions.append(contentsOf: questionModel.getRandomQuestions(complexity: .easy))
        questions.append(contentsOf: questionModel.getRandomQuestions(complexity: .medium))
        questions.append(contentsOf: questionModel.getRandomQuestions(complexity: .hard))
        return questions
    }
    
    func checkTrueAns(ans: String, questionNumber: Int) -> Bool {
        if ans == QuestionModel().allQuestions[questionNumber - 1].trueAnswer {
            return true
        }
        else {
            return false
        }
    }
    
    func useHint50(question: QuestionModel.Question) -> (String, String) {
        var allAnswers = question.answers.filter({$0 != question.trueAnswer})
        let firstIndex = Int.random(in: 0...2)
        let firstItem = allAnswers.remove(at: firstIndex)
        let secondIndex = Int.random(in: 0...1)
        let secondItem = allAnswers.remove(at: secondIndex)
        return (firstItem, secondItem)
    }
    
    func useHintTeam(question: QuestionModel.Question) -> String {
        return question.trueAnswer
    }
    
    func useHintPhone(questions: QuestionModel.Question) -> String {
        return questions.trueAnswer
    }
    
    func useHint(gameId: Int, hintName: String, question: QuestionModel.Question) {
        if var game = getCurrentGameById(by: gameId) {
            for i in 0..<game.hints.count {
                if game.hints[i].hintName == hintName {
                    if !game.hints[i].isUsed {
                        game.hints[i].isUsed = true
                        return game.hints[i].completion(question)
                    }
                }
            }
        }
    }
    
    func getCurrentGameById(by id: Int) -> Game? {
        for game in games {
            if game.id == id {
                return game
            }
        }
        return nil
    }
}

var sumsForQuestions: [Int: Int] = [
    1: 1_00,
    2: 2_00,
    3: 3_00,
    4: 5_00,
    5: 1_000,
    6: 2_000,
    7: 4_000,
    8: 8_000,
    9: 16_000,
    10: 32_000,
    11: 64_000,
    12: 125_000,
    13: 250_000,
    14: 500_000,
    15: 1_000_000,
    
]
