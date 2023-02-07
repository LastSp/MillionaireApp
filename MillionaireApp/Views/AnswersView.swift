import UIKit

class AnswersView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
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
        label.text = "What year was the year, when first deodorant was invented in our life?"
        label.textColor = .white
        label.numberOfLines = 5
        label.contentMode = .left
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
    
    private func createLetterLabel(letter: String) -> UILabel {
        let labelLetter = UILabel()
        labelLetter.text = letter
        labelLetter.textColor = .white
        labelLetter.font = labelLetter.font.withSize(30)
        labelLetter.translatesAutoresizingMaskIntoConstraints = false
        labelLetter.contentMode = .left
        return labelLetter
    }
    
    private func createAnswerLabel(answer: String) -> UILabel {
        let labelLetter = UILabel()
        labelLetter.text = answer
        labelLetter.textColor = .white
        labelLetter.font = labelLetter.font.withSize(30)
        labelLetter.translatesAutoresizingMaskIntoConstraints = false
        labelLetter.contentMode = .right
        return labelLetter
    }
    
    private func createAnswerButton(letter: String, answer: String) -> UIButton {
        let button = UIButton()
        let imageView = UIImageView(image: buttonBackgroundImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(imageView)
        
        let labelLetter = createLetterLabel(letter: letter)
        let labelAnswer = createAnswerLabel(answer: answer)
        
        button.addSubview(labelLetter)
        button.addSubview(labelAnswer)
        

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: button.topAnchor),
            imageView.leftAnchor.constraint(equalTo: button.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: button.rightAnchor, constant: 20),
            imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor, constant: 25),
            
            labelLetter.leftAnchor.constraint(equalTo: button.leftAnchor, constant: 20),
            labelLetter.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            
            labelAnswer.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -20),
            labelAnswer.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])

        self.addSubview(button)
        return button
    }
    
    private lazy var buttonsStackView: UIStackView = {
        let buttonA = createAnswerButton(letter: "A", answer: "1956")
        let buttonB = createAnswerButton(letter: "B", answer: "1912")
        let buttonC = createAnswerButton(letter: "C", answer: "1942")
        let buttonD = createAnswerButton(letter: "D", answer: "1930")
        
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
    
    @objc
    private func changeImage(sender: UIButton) {
        if sender.tag == tagHelp50 {
            help50Button.image = noHelp50Image
        }
        else if sender.tag == tagHelpTeam {
            helpTeamButton.image = noHelpTeamImage
        }
        else if sender.tag == tagHelpPhone {
            helpPhoneButton.image = noHelpPhoneImage
        }
    }
    
    private lazy var help50Button: CustomButtonView = {
        let help50Button = CustomButtonView()
        help50Button.translatesAutoresizingMaskIntoConstraints = false
        help50Button.image = help50Image
        help50Button.button.addTarget(self, action: #selector(changeImage), for: .touchDown)
        help50Button.button.tag = tagHelp50
        return help50Button
    }()
    
    private lazy var helpTeamButton: CustomButtonView = {
        let helpTeamButton = CustomButtonView()
        helpTeamButton.translatesAutoresizingMaskIntoConstraints = false
        helpTeamButton.image = helpTeamImage
        helpTeamButton.button.addTarget(self, action: #selector(changeImage), for: .touchDown)
        helpTeamButton.button.tag = tagHelpTeam
        return helpTeamButton
    }()
    
    private lazy var helpPhoneButton: CustomButtonView = {
        let helpPhoneButton = CustomButtonView()
        helpPhoneButton.translatesAutoresizingMaskIntoConstraints = false
        helpPhoneButton.image = helpPhoneImage
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
        stack.distribution = .equalSpacing
        stack.alignment = .center
        
        NSLayoutConstraint.activate([
            helpPhoneButton.rightAnchor.constraint(equalTo: stack.rightAnchor),
            help50Button.widthAnchor.constraint(equalToConstant: 120),
            helpPhoneButton.heightAnchor.constraint(equalToConstant: 100),
            helpPhoneButton.widthAnchor.constraint(equalToConstant: 120),
            helpTeamButton.heightAnchor.constraint(equalToConstant: 100),
            help50Button.heightAnchor.constraint(equalToConstant: 100),
            helpTeamButton.widthAnchor.constraint(equalToConstant: 120),
            help50Button.leftAnchor.constraint(equalTo: stack.leftAnchor),
            
        ])
        
        self.addSubview(stack)
        return stack
    }()
    
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


            questionTextLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 39),
            questionTextLabel.leftAnchor.constraint(equalTo: logoImageView.rightAnchor, constant: 10),
            questionTextLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            questionTextLabel.heightAnchor.constraint(equalToConstant: 100),


            questionNumberLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            questionNumberLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 40),


            questionPriceLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            questionPriceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),


            buttonsStackView.topAnchor.constraint(equalTo: questionNumberLabel.bottomAnchor, constant: 40),
            buttonsStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            buttonsStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            buttonsStackView.heightAnchor.constraint(equalToConstant: 400),
            
            helpsStackView.topAnchor.constraint(equalTo: buttonsStackView.bottomAnchor, constant: 20),
            helpsStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            helpsStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            helpsStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
}

private let backgroundImage = UIImage(named: "background")
private let logoImage = UIImage(named: "logo")
private let buttonBackgroundImage = UIImage(named: "button")
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
