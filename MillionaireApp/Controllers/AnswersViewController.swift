import UIKit
import SwiftUI


class AnswersViewController: UIViewController {
    
    let answerView = AnswersView(frame: UIScreen.main.bounds)
    var gameModel = GameModel()
    var currentNickname: String? = nil
    var currentNumberQuestion: Int? = nil
    var questionViewController: QuestionsViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = answerView
        startGame(nickname: "NTilt",
                  hints: [
                    Hint(hintName: "help50",
                         isUsed: false,
                         completion: {[self] (question) in
                        let first = gameModel.useHint50(question: question)
                        answerView.hideTwoButtons(first: first.0, second: first.1)
                    }),
                    Hint(hintName: "helpTeam",
                         isUsed: false,
                         completion:{ [self] (question) in
                             let trueAns = gameModel.useHintTeam(question: question)
                             showAllert(title: "Самый популярный ответ зала", message: trueAns)
                         }),
                    Hint(hintName: "helpPhone",
                         isUsed: false,
                         completion: { [self] (question) in
                             let trueAns = gameModel.useHintPhone(questions: question)
                             showAllert(title: "Ответ друга:", message: trueAns)
                         }),
        ])
    }
    
    var timer = Timer()
    var continueGameCompletion: ((Bool) -> ())?
    
    private func showAllert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func startGame(nickname: String?, hints: [Hint]) {
        let player = Player(nickname: nickname)
        let game = gameModel.createGame(player: player, hints: hints)
        nextQuestion(game: game)
    }
    
    func toThePrevScreen(isTrue: Bool) {
        questionViewController?.trueAns = isTrue
        questionViewController?.currentNumberQuestion = currentNumberQuestion!
        self.dismiss(animated: true)
    }
    
    func nextQuestion(game: GameModel.Game) {
        let questionText = game.questions[currentNumberQuestion! - 1].questionText
        let questionAnswers = game.questions[currentNumberQuestion! - 1].answers
        let price = game.sumForQuestion[currentNumberQuestion!]!
        answerView.setQuestions(title: questionText,
                                answers: questionAnswers,
                                price: price,
                                number: currentNumberQuestion!,
                                answerButtonCompletion: { [self] (ans, letter) in
            answerView.playerSelectButton(letter: letter)
            timer = Timer.scheduledTimer(withTimeInterval: 5, repeats: false, block: { [self] _ in
                if gameModel.checkTrueAns(ans: ans, questionNumber: currentNumberQuestion!) {
                    answerView.setButtonImage(letter: letter, image: UIImage(named: "true_background")!)
                    timer.invalidate()
                    Timer.scheduledTimer(withTimeInterval: 5,
                                                 repeats: false, block: {[self] _ in
                        answerView.reloadAllButtons()
                        currentNumberQuestion! += 1
                        toThePrevScreen(isTrue: true)
                        
                    })
                }
                else {
                    answerView.setButtonImage(letter: letter, image: UIImage(named: "false_background")!)
                    timer.invalidate()
                    Timer.scheduledTimer(withTimeInterval: 1,
                                                 repeats: false, block: {[self] _ in
                        currentNumberQuestion! += 1
                        toThePrevScreen(isTrue: false)
                    })
                }
            })
        },
                                hintButtonCompletion: {[self] hintName in
            gameModel.useHint(gameId: game.id, hintName: hintName, question: game.questions[currentNumberQuestion! - 1])

            
        })
    }
}

struct MyProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return AnswersViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

