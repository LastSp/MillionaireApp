//
//  CustomButtonAnswerView.swift
//  MillionaireApp
//
//  Created by Никита Ясеник on 08.02.2023.
//

import Foundation
import UIKit

class CustomButtonAnswerView: UIView {
    
    var answerText: String? = nil {
        willSet {
            labelAnswer.text = newValue ?? ""
        }
    }
    var letterText: String? = nil {
        willSet {
            labelLetter.text = newValue ?? ""
        }
    }
    var backgroundImage: UIImage? = nil {
        willSet {
            backgroundImageView.image = newValue ?? UIImage(named: "normal_background")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(checkAns), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        return button
    }()
    
    var checkAnsCompletion: ((String, String) -> ())?
    
    @objc func checkAns(sender: UIButton) {
        let currentAnswer = labelAnswer.text!
        let currentLetter = labelLetter.text!
        checkAnsCompletion?(currentAnswer, currentLetter)
    }
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: backgroundImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: button.topAnchor),
            imageView.leftAnchor.constraint(equalTo: button.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: button.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor),
        ])
        return imageView
    }()
    
    private lazy var labelAnswer: UILabel = {
        let labelAnswer = UILabel()
        labelAnswer.text = ""
        labelAnswer.textColor = .white
        labelAnswer.font = labelAnswer.font.withSize(30)
        labelAnswer.translatesAutoresizingMaskIntoConstraints = false
        labelAnswer.contentMode = .right
        button.addSubview(labelAnswer)
        NSLayoutConstraint.activate([
            labelAnswer.rightAnchor.constraint(equalTo: button.rightAnchor, constant: -20),
            labelAnswer.centerYAnchor.constraint(equalTo: button.centerYAnchor)
        ])
        return labelAnswer
    }()
    
    lazy var labelLetter: UILabel = {
        let labelLetter = UILabel()
        labelLetter.text = ""
        labelLetter.textColor = .white
        labelLetter.font = labelLetter.font.withSize(30)
        labelLetter.translatesAutoresizingMaskIntoConstraints = false
        labelLetter.contentMode = .left
        button.addSubview(labelLetter)
        NSLayoutConstraint.activate([
            labelLetter.leftAnchor.constraint(equalTo: button.leftAnchor, constant: 20),
            labelLetter.centerYAnchor.constraint(equalTo: button.centerYAnchor),
        ])
        return labelLetter
    }()
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.leftAnchor.constraint(equalTo: self.leftAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }
}
