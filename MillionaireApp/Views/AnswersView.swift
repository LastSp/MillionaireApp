import UIKit

class AnswersView: UIView {
    
    var time: Int = 30 {
        willSet {
            timerLabel.text = "\(time)"
        }
    }
    
    var timer = Timer()
    
    
    
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.text = "\(time)"
        label.font = .systemFont(ofSize: 24)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        return label
    }()
    
    var currentHelp50: Bool = true {
        willSet {
            help50Button.image = !newValue ? help50Image : noHelp50Image
        }
    }
    var currentHelpTeam: Bool = true {
        willSet {
            helpTeamButton.image = !newValue ? helpTeamImage : noHelpTeamImage
        }
    }
    var currentHelpPhone: Bool = true {
        willSet {
            helpPhoneButton.image = !newValue ? helpPhoneImage : noHelpPhoneImage
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeTime), userInfo: nil, repeats: true)
    }
    
    @objc func changeTime() {
        time -= 1
        
        if time == 0 {
            time = 0
            timer.invalidate()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let view = UIImageView(image: backgroundImage)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        return view
    }()
    
    private lazy var logoImageView: UIImageView = {
        let view = UIImageView(image: logoImage)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        return view
    }()
    
    private lazy var helpTeamImageView: UIImageView = {
        let view = UIImageView(image: helpTeamImage)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        return view
    }()
    
    private lazy var helpPhoneImageView: UIImageView = {
        let view = UIImageView(image: helpPhoneImage)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        return view
    }()
    
    private lazy var help50ImageView: UIImageView = {
        let view = UIImageView(image: help50Image)
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        return view
    }()
    
    private lazy var questionTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .white
        label.numberOfLines = 8
        label.contentMode = .topLeft
        label.font = label.font.withSize(20)
        self.addSubview(label)
        return label
    }()
    
    private lazy var questionNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Question 2"
        label.textColor = .white
        label.numberOfLines = 1
        label.contentMode = .left
        label.font = label.font.withSize(24)
        self.addSubview(label)
        return label
    }()
    
    private lazy var questionPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "500 RUB"
        label.textColor = .white
        label.numberOfLines = 1
        label.contentMode = .left
        label.font = label.font.withSize(24)
        self.addSubview(label)
        return label
    }()
    
    private lazy var buttonA: CustomButtonAnswerView = {
        let button = CustomButtonAnswerView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundImage = buttonBackgroundImage
        button.answerText = "1111"
        button.letterText = "A"
        return button
    }()
    
    private lazy var buttonB: CustomButtonAnswerView = {
        let button = CustomButtonAnswerView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundImage = buttonBackgroundImage
        button.answerText = "2222"
        button.letterText = "B"
        return button
    }()
    
    private lazy var buttonC: CustomButtonAnswerView = {
        let button = CustomButtonAnswerView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundImage = buttonBackgroundImage
        button.answerText = "3333"
        button.letterText = "C"
        return button
    }()
    
    private lazy var buttonD: CustomButtonAnswerView = {
        let button = CustomButtonAnswerView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundImage = buttonBackgroundImage
        button.answerText = "4444"
        button.letterText = "D"
        return button
    }()
    
    func setButtonImage(letter: String, image: UIImage) {
        if buttonA.labelLetter.text! == letter {
            buttonA.backgroundImage = image
        }
        else if buttonB.labelLetter.text! == letter {
            buttonB.backgroundImage = image
        }
        else if buttonC.labelLetter.text! == letter {
            buttonC.backgroundImage = image
        }
        else if buttonD.labelLetter.text! == letter {
            buttonD.backgroundImage = image
        }
    }
    
    func hideTwoButtons(first: String, second: String) {
        if buttonA.answerText! == first || buttonA.answerText! == second {
            buttonA.alpha = 0
        }
        if buttonB.answerText! == first || buttonB.answerText! == second {
            buttonB.alpha = 0
        }
        if buttonC.answerText! == first || buttonC.answerText! == second {
            buttonC.alpha = 0
        }
        if buttonD.answerText! == first || buttonD.answerText! == second {
            buttonD.alpha = 0
        }
    }
    
    func hideHelpButton() {
        help50Button.isUserInteractionEnabled = false
        helpPhoneButton.isUserInteractionEnabled = false
        helpTeamButton.isUserInteractionEnabled = false
    }
    
    func unHideHelpButton() {
        if help50Button.image != noHelp50Image {
            help50Button.isUserInteractionEnabled = true
        }
        if helpTeamButton.image != noHelpTeamImage {
            helpTeamButton.isUserInteractionEnabled = true
        }
        if helpPhoneButton.image != noHelpPhoneImage {
            helpPhoneButton.isUserInteractionEnabled = true
        }
    }
    
    func hideButton(buttons: [CustomButtonAnswerView]) {
        for button in buttons {
            if button.alpha != 0 {
                button.alpha = 0.3
                button.isUserInteractionEnabled = false
            }
        }
    }
    
    func playerSelectButton(letter: String) {
        hideHelpButton()
        if buttonA.labelLetter.text! == letter {
            hideButton(buttons: [buttonD, buttonB, buttonC])
        }
        else if buttonB.labelLetter.text! == letter {
            hideButton(buttons: [buttonD, buttonA, buttonC])
        }
        else if buttonC.labelLetter.text! == letter {
            hideButton(buttons: [buttonD, buttonB, buttonA])
            
        }
        else if buttonD.labelLetter.text! == letter {
            hideButton(buttons: [buttonA, buttonB, buttonC])
        }
    }
    
    private lazy var buttonsStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [
            buttonA,
            buttonB,
            buttonC,
            buttonD
        ])
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = 20
        self.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            buttonD.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
            buttonD.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            buttonD.rightAnchor.constraint(equalTo: stackView.rightAnchor),

            buttonC.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            buttonC.rightAnchor.constraint(equalTo: stackView.rightAnchor),

            buttonB.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            buttonB.rightAnchor.constraint(equalTo: stackView.rightAnchor),

            buttonA.leftAnchor.constraint(equalTo: stackView.leftAnchor),
            buttonA.rightAnchor.constraint(equalTo: stackView.rightAnchor),
            
            
        ])
        
        return stackView
    }()
    
    var hintHelp50Completion: ((String) -> ())?
    var hintHelpTeamCompletion: ((String) -> ())?
    var hintHelpPhoneCompletion: ((String) -> ())?
    
    @objc
    private func changeImage(sender: UIButton) {
        if sender.tag == tagHelp50 {
            help50Button.image = noHelp50Image
            help50Button.isUserInteractionEnabled = false
            hintHelp50Completion?("help50")
        }
        else if sender.tag == tagHelpTeam {
            helpTeamButton.image = noHelpTeamImage
            helpTeamButton.isUserInteractionEnabled = false
            hintHelpTeamCompletion?("helpTeam")
        }
        else if sender.tag == tagHelpPhone {
            helpPhoneButton.image = noHelpPhoneImage
            helpPhoneButton.isUserInteractionEnabled = false
            hintHelpPhoneCompletion?("helpPhone")
        }
    }
    
    private lazy var help50Button: CustomButtonHintView = {
        let help50Button = CustomButtonHintView()
        help50Button.translatesAutoresizingMaskIntoConstraints = false
        if currentHelp50 {
            help50Button.image = help50Image
        }
        else {
            help50Button.image = noHelp50Image
        }
        help50Button.button.addTarget(self, action: #selector(changeImage), for: .touchDown)
        help50Button.button.tag = tagHelp50
        return help50Button
    }()
    
    private lazy var helpTeamButton: CustomButtonHintView = {
        let helpTeamButton = CustomButtonHintView()
        helpTeamButton.translatesAutoresizingMaskIntoConstraints = false
        if currentHelpTeam {
            helpTeamButton.image = helpTeamImage
        } else {
            helpTeamButton.image = noHelpTeamImage
        }
        helpTeamButton.button.addTarget(self, action: #selector(changeImage), for: .touchDown)
        helpTeamButton.button.tag = tagHelpTeam
        return helpTeamButton
    }()
    
    private lazy var helpPhoneButton: CustomButtonHintView = {
        let helpPhoneButton = CustomButtonHintView()
        helpPhoneButton.translatesAutoresizingMaskIntoConstraints = false
        if currentHelpPhone {
            helpPhoneButton.image = helpPhoneImage
        }
        else {
            helpPhoneButton.image = helpPhoneImage
        }
        helpPhoneButton.button.addTarget(self, action: #selector(changeImage), for: .touchDown)
        helpPhoneButton.button.tag = tagHelpPhone
        return helpPhoneButton
    }()
    
    private lazy var helpsStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            help50Button,
            helpTeamButton,
            helpPhoneButton,
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        stack.spacing = 20
        
        NSLayoutConstraint.activate([
            helpPhoneButton.rightAnchor.constraint(equalTo: stack.rightAnchor),
            helpPhoneButton.heightAnchor.constraint(equalToConstant: 100),
            helpTeamButton.heightAnchor.constraint(equalToConstant: 100),
            help50Button.heightAnchor.constraint(equalToConstant: 100),
            help50Button.leftAnchor.constraint(equalTo: stack.leftAnchor),
            
        ])
        
        self.addSubview(stack)
        return stack
    }()
    
    func reloadAllButtons() {
        buttonA.isUserInteractionEnabled = true
        buttonB.isUserInteractionEnabled = true
        buttonC.isUserInteractionEnabled = true
        buttonD.isUserInteractionEnabled = true
        
        
        buttonA.alpha = 1
        buttonB.alpha = 1
        buttonC.alpha = 1
        buttonD.alpha = 1
        
        buttonA.backgroundImage = nil
        buttonB.backgroundImage = nil
        buttonC.backgroundImage = nil
        buttonD.backgroundImage = nil
        buttonD.backgroundImage = nil
        
        unHideHelpButton()
        
    }
    
    func setQuestions(title: String, answers: [String], price: Int, number: Int,
                      answerButtonCompletion: @escaping (String, String) -> (),
                      hintButtonCompletion: @escaping (String) -> ()) {
        self.questionTextLabel.text = title
        self.buttonA.answerText = answers[0]
        self.buttonB.answerText = answers[1]
        self.buttonC.answerText = answers[2]
        self.buttonD.answerText = answers[3]
        self.questionPriceLabel.text = "\(String(price)) RUB"
        self.questionNumberLabel.text = "Question \(number)"
        self.buttonA.checkAnsCompletion = answerButtonCompletion
        self.buttonB.checkAnsCompletion = answerButtonCompletion
        self.buttonC.checkAnsCompletion = answerButtonCompletion
        self.buttonD.checkAnsCompletion = answerButtonCompletion
        self.hintHelp50Completion = hintButtonCompletion
        self.hintHelpTeamCompletion = hintButtonCompletion
        self.hintHelpPhoneCompletion = hintButtonCompletion
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor),


            logoImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 39),
            logoImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),


            questionTextLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            questionTextLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 10),
            questionTextLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            questionTextLabel.heightAnchor.constraint(equalToConstant: 150),


            questionNumberLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            questionNumberLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),
            
            timerLabel.leftAnchor.constraint(equalTo: questionNumberLabel.rightAnchor, constant: 65),
            timerLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),


            questionPriceLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            questionPriceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),


            buttonsStackView.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: 40),
            buttonsStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            buttonsStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 350),
            
            helpsStackView.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor),
            helpsStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            helpsStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            helpsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
}

private let backgroundImage = UIImage(named: "background")
private let trueBackgroundImage = UIImage(named: "true_background")
private let falseBackgroundImage = UIImage(named: "false_background")
private let logoImage = UIImage(named: "logo")
private let buttonBackgroundImage = UIImage(named: "normal_background")
private let helpTeamImage = UIImage(named: "helpTeam")
private let helpPhoneImage = UIImage(named: "helpPhone")
private let help50Image = UIImage(named: "help50")
private let leftLine = UIImage(named: "leftLine")
private let rightLine = UIImage(named: "rightLine")
private let noHelp50Image = UIImage(named: "noHelp50")
private let noHelpTeamImage = UIImage(named: "noHelpTeam")
private let noHelpPhoneImage = UIImage(named: "noHelpPhone")
private let tagHelp50: Int = 1
private let tagHelpTeam: Int = 2
private let tagHelpPhone: Int = 3


