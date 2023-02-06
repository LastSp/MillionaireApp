import UIKit

class AnswersView: UIView {
    private let backgroundImage = UIImage(named: "background")
    private let logoImage = UIImage(named: "logo")
    private let buttonBackgroundImage = UIImage(named: "button")
    private let helpTeamImage = UIImage(named: "helpTeam")
    private let helpPhoneImage = UIImage(named: "helpPhone")
    private let help50Image = UIImage(named: "help50")
    private let leftLine = UIImage(named: "leftLine")
    private let rightLine = UIImage(named: "rightLine")
    
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
        let leftImage = UIImageView(image: leftLine)
        leftImage.tag = 100
        let rightImage = UIImageView(image: rightLine)
        rightImage.tag = 101
        if let toRemove = sender.viewWithTag(100),
           let toRemoveRight = sender.viewWithTag(101) {
            toRemove.removeFromSuperview()
            toRemoveRight.removeFromSuperview()
        }
        else {
            sender.addSubview(leftImage)
            sender.addSubview(rightImage)
        }
        
    }
    
    private func createHelpButton(imageView: UIImageView) -> UIButton {
        let button = UIButton()
        button.layer.cornerRadius = 60
        button.addSubview(imageView)
        button.addTarget(self, action: #selector(changeImage), for: .touchDown)
        
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: button.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: button.rightAnchor),
            imageView.topAnchor.constraint(equalTo: button.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor)
        ])
        
        self.addSubview(button)
        return button
    }
    
    private lazy var helpsStackView: UIStackView = {
        let help50Button = createHelpButton(imageView: help50ImageView)
        let helpTeamButton = createHelpButton(imageView: helpTeamImageView)
        let helpPhoneButton = createHelpButton(imageView: helpPhoneImageView)
        let stack = UIStackView(arrangedSubviews: [
            help50Button,
            helpTeamButton,
            helpPhoneButton
        ])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .center
        
        NSLayoutConstraint.activate([
            helpPhoneButton.rightAnchor.constraint(equalTo: stack.rightAnchor),
            helpPhoneButton.heightAnchor.constraint(equalToConstant: 100),
//            helpTeamButton.rightAnchor.constraint(equalTo: helpPhoneButton.leftAnchor, constant: -10),
            helpTeamButton.heightAnchor.constraint(equalToConstant: 100),
//            help50Button.rightAnchor.constraint(equalTo: helpTeamButton.leftAnchor, constant: -10),
            help50Button.heightAnchor.constraint(equalToConstant: 100),
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
