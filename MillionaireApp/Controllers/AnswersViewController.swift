import UIKit
import SwiftUI
import AVFoundation


class AnswersViewController: UIViewController {
    
    let answerView = AnswersView(frame: UIScreen.main.bounds)
    var gameModel = GameModel()
    var currentSum: Int = 0
    var currentNickname: String? = nil
    var currentNumberQuestion: Int? = nil
    var questionViewController: QuestionsViewController?
    var current50: Bool = false
    var currentTeam: Bool = false
    var currentPhone: Bool = false
    var game: GameModel.Game? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startGame(nickname: "NTilt",
                  hints: [
                    Hint(hintName: "help50",
                         isUsed: current50,
                         completion: {[self] (question) in
                        let first = gameModel.useHint50(question: question)
                        answerView.hideTwoButtons(first: first.0, second: first.1)
                    }),
                    Hint(hintName: "helpTeam",
                         isUsed: currentTeam,
                         completion:{ [self] (question) in
                             let trueAns = gameModel.useHintTeam(question: question)
                             showAllert(title: "Самый популярный ответ зала", message: trueAns)
                         }),
                    Hint(hintName: "helpPhone",
                         isUsed: currentPhone,
                         completion: { [self] (question) in
                             let trueAns = gameModel.useHintPhone(questions: question)
                             showAllert(title: "Ответ друга:", message: trueAns)
                         }),
        ])
        self.view = answerView
        answerView.currentHelpTeam = currentTeam
        answerView.currentHelpPhone = currentPhone
        answerView.currentHelp50 = current50
    }
    
    func stopTimer() {
        answerView.timer.invalidate()
    }
    
    var timer = Timer()
    var timer30 = Timer()
    var continueGameCompletion: ((Bool) -> ())?
    
    private func showAllert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    func startGame(nickname: String?, hints: [Hint]) {
        let player = Player(nickname: nickname)
        self.game = gameModel.createGame(player: player, hints: hints)
        nextQuestion()
    }
    
    func toThePrevScreen(isTrue: Bool) {
        questionViewController?.trueAns = isTrue
        questionViewController?.currentNumberQuestion = currentNumberQuestion!
        questionViewController?.current50 = current50
        questionViewController?.currentPhone = currentPhone
        questionViewController?.currentTeam = currentTeam
        questionViewController?.currentSum = currentSum
        self.dismiss(animated: true)
    }
    
    func nextQuestion() {
        let questionText = game!.questions[currentNumberQuestion! - 1].questionText
        let questionAnswers = game!.questions[currentNumberQuestion! - 1].answers
        let price = game!.sumForQuestion[currentNumberQuestion!]!
        soundPlay(nameSound: "start_sound")
        timer30 = Timer.scheduledTimer(withTimeInterval: 30, repeats: false, block: { [self]_ in
            soundPlay(nameSound: "false_ans_sound")
            Timer.scheduledTimer(withTimeInterval: 5,
                                         repeats: false, block: {[self] _ in
                currentNumberQuestion! += 1
                player.stop()
                toThePrevScreen(isTrue: false)
            })
        })
        answerView.setQuestions(title: questionText,
                                answers: questionAnswers,
                                price: price,
                                number: currentNumberQuestion!,
                                answerButtonCompletion: { [self] (ans, letter) in
            answerView.playerSelectButton(letter: letter)
            timer30.invalidate()
            stopTimer()
            soundPlay(nameSound: "expectation_sound")
            timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: false, block: { [self] _ in
                if gameModel.checkTrueAns(ans: ans, questionNumber: currentNumberQuestion!) {
                    answerView.setButtonImage(letter: letter, image: UIImage(named: "true_background")!)
                    timer.invalidate()
                    soundPlay(nameSound: "true_ans_sound")
                    Timer.scheduledTimer(withTimeInterval: 5,
                                                 repeats: false, block: {[self] _ in
                        answerView.reloadAllButtons()
                        currentNumberQuestion! += 1
                        currentSum = price
                        player.stop()
                        toThePrevScreen(isTrue: true)
                    })
                }
                else {
                    answerView.setButtonImage(letter: letter, image: UIImage(named: "false_background")!)
                    timer.invalidate()
                    soundPlay(nameSound: "false_ans_sound")
                    Timer.scheduledTimer(withTimeInterval: 5,
                                                 repeats: false, block: {[self] _ in
                        currentNumberQuestion! += 1
                        player.stop()
                        toThePrevScreen(isTrue: false)
                    })
                }
            })
        },
                                hintButtonCompletion: {[self] hintName in
            if hintName == "help50" {
                current50 = true
            }
            else if hintName == "helpPhone" {
                currentPhone = true
            }
            else if hintName == "helpTeam" {
                currentTeam = true
            }
            gameModel.useHint(gameId: game!.id, hintName: hintName, question: game!.questions[currentNumberQuestion! - 1])

            
        })
    }
    var player: AVAudioPlayer!
    
    func soundPlay(nameSound: String) {
        guard let url = Bundle.main.url(forResource: nameSound, withExtension: "mp3") else { return }
        player = try! AVAudioPlayer(contentsOf: url)
        player.play()
        
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

