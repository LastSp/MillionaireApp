//
//  FirstViewController.swift
//  MillionaireApp
//
//  Created by Alexey Davidenko on 07.02.2023.
//

import UIKit

class GreetingsViewController: UIViewController {
    
    //let customColor = UIColor(red: 87/255, green: 225/255, blue: 165/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setupLayout()
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
    
    private lazy var label1: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var label2: UILabel = {
        let label = UILabel()
        label.text = "to Who Wants \n to be a Millionare "
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button1: UIButton = {
        let button = UIButton(type: .system)

        let title = "Правила игры"
        let myAttributed = [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 37)]
        let attributedString = NSMutableAttributedString(string: title, attributes: myAttributed)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: title.count))
        button.setAttributedTitle(attributedString, for: .normal)
        button.setTitleColor(UIColor(named: "buttonTitleColor"), for: .normal)
        button.clipsToBounds = true
        //button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton(type: .system)
        
        let title = "Начать игру"
        let myAttributed = [NSMutableAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 37)]
        let attributedString = NSMutableAttributedString(string: title, attributes: myAttributed)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: title.count))
        button.setAttributedTitle(attributedString, for: .normal)
        
        button.titleLabel?.font =  UIFont(name: "Roboto", size: 52)
        button.setTitleColor(UIColor(named: "buttonTitleColor"), for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(startGameButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(backgroundImageView)
        view.addSubview(logoImageView)
        view.addSubview(label1)
        view.addSubview(label2)
        //view.addSubview(button1)
        view.addSubview(button2)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
        logoImageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 95),
        logoImageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -95),
        logoImageView.heightAnchor.constraint(equalTo: logoImageView.widthAnchor),
        
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        backgroundImageView.leftAnchor.constraint(equalTo: view.leftAnchor),
        backgroundImageView.rightAnchor.constraint(equalTo: view.rightAnchor),
        
        
        label1.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 17),
        label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 9),
        label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),

//        button1.bottomAnchor.constraint(equalTo: button2.topAnchor, constant: -40),
//        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),

//        button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 40),
        button2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-80),
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func startGameButton() {
        let selectNicknameVC = SelectNicknameViewController()
        selectNicknameVC.modalPresentationStyle = .fullScreen
        self.present(selectNicknameVC, animated: true)
    }

}


