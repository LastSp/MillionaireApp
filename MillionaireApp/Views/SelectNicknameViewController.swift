//
//  SecondViewController.swift
//  MillionaireApp
//
//  Created by Alexey Davidenko on 07.02.2023.
//

import UIKit
import SwiftUI

class SelectNicknameViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Outlets
    
    private lazy var backgroundImageView: UIImageView = {
        let image = UIImage(named: "background")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var selectNicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter your nickname"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.borderStyle = .roundedRect
        textField.layer.borderColor = UIColor.white.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var selectNicknameButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(registerButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var moneyImageView: UIImageView = {
        let image = UIImage(named: "money")
        let imageView = UIImageView(image: image)
        imageView.transform = CGAffineTransform(rotationAngle: 0.1664)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var imageView3: UIImageView = {
        let image = UIImage(named: "money")
        let imageView = UIImageView(image: image)
        imageView.transform = CGAffineTransform(rotationAngle: -0.2)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(selectNicknameLabel)
        view.addSubview(textField)
        view.addSubview(selectNicknameButton)
        view.addSubview(moneyImageView)
        view.addSubview(imageView3)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 95),
            logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -95),
            logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
            
            selectNicknameLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 17),
            selectNicknameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            textField.topAnchor.constraint(equalTo: selectNicknameLabel.bottomAnchor, constant: 17),
            //textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 54),
            // textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -54),
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.heightAnchor.constraint(equalToConstant: 47),
            textField.widthAnchor.constraint(equalToConstant: 261),
            
            selectNicknameButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 17),
            //        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 54),
            //        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -54),
            selectNicknameButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectNicknameButton.heightAnchor.constraint(equalToConstant: 47),
            selectNicknameButton.widthAnchor.constraint(equalToConstant: 261),
            
            moneyImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40),
            
            imageView3.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
            imageView3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 200)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func registerButton() {
        var questionsVC = QuestionsViewController()
        if textField.text! == "" {
            questionsVC.currentNickname = "Неизвестный игрок"
        }
        questionsVC.currentNickname = textField.text!
        questionsVC.modalPresentationStyle = .fullScreen     
        self.present(questionsVC, animated: true)
    }
}

struct MyProvider1: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            return SelectNicknameViewController()
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
    }
}
