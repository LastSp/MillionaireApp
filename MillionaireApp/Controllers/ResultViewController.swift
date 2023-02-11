import UIKit
import SwiftUI

class ResultViewController: UIViewController {
    
    let resultOfGame: Bool
    let numberOfAttempts: Int
    let finalSum: Int
    
    private let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var finalSumLabel: UILabel = {
        let label = UILabel()
        if resultOfGame {
            label.text = "Congratulations to the winner! \n The winning amount is \n \(finalSum) RUB"
            label.numberOfLines = 3
        }
        else {
            label.text = "Unfortunately you lost! \n Good luck next time! \n The winning amount is \n \(finalSum) RUB"
            label.numberOfLines = 4
        }
        
        
        label.textColor = .yellow
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40)
        label.text = "LOSE"
        label.textColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let attemptLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 26)
        label.text = "You lost on 5 attempt"
        label.textAlignment = .center
        label.textColor = .yellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let playAgainButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("PLAY AGAIN", for: .normal)
        button.layer.cornerRadius = 8
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapPlayAgain), for: .touchUpInside)
        return button
    }()
    
    //MARK: -ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        setUpConstraits()
        setUpBackgroundImage()
    }
    
    init(result: Bool, numberOfAttempts: Int, finalSum: Int) {
        self.resultOfGame = result
        self.numberOfAttempts = numberOfAttempts
        self.finalSum = finalSum
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureVC() {
        if resultOfGame {
            resultLabel.text = "WIN"
            resultLabel.textColor = .green
        } else {
            attemptLabel.text = "You lost on \(numberOfAttempts) attempt"
        }
    }
    
    private func setUpBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "background")
            backgroundImage.contentMode = .scaleToFill
            self.view.insertSubview(backgroundImage, at: 0)
    }
    
    private func setUpConstraits() {
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 140),
            logoImageView.heightAnchor.constraint(equalToConstant: 140)
        ])
        
        if resultOfGame {
            view.addSubview(resultLabel)
            NSLayoutConstraint.activate([
                resultLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
                resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            view.addSubview(finalSumLabel)
            NSLayoutConstraint.activate([
                finalSumLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40),
                finalSumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        } else {
            view.addSubview(attemptLabel)
            view.addSubview(resultLabel)
            view.addSubview(finalSumLabel)
            NSLayoutConstraint.activate([
                finalSumLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 40),
                finalSumLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
            NSLayoutConstraint.activate([
                attemptLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
                attemptLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
                attemptLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -15),
            
                resultLabel.topAnchor.constraint(equalTo: attemptLabel.bottomAnchor, constant: 10),
                resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        }
        
        view.addSubview(playAgainButton)
        NSLayoutConstraint.activate([
            playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playAgainButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            playAgainButton.heightAnchor.constraint(equalToConstant: 50),
            playAgainButton.widthAnchor.constraint(equalToConstant: 260)
        ])
    }
                                    
    @objc private func didTapPlayAgain() {
        let startVC = GreetingsViewController()
        startVC.modalPresentationStyle = .fullScreen
        self.present(startVC, animated: true)
    }
}


struct MyProvider2: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return ResultViewController(result: false, numberOfAttempts: 10, finalSum: 1_000_000)
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}

