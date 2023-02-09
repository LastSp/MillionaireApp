//
//  FirstViewController.swift
//  MillionaireApp
//
//  Created by Alexey Davidenko on 07.02.2023.
//

import UIKit

class FirstViewController: UIViewController {
    
    let customColor = UIColor(red: 87/255, green: 225/255, blue: 165/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupHierarchy()
        setupLayout()
        
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
    }
    
// MARK: - Outlets
    
    private lazy var imageView: UIImageView = {
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
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: title.count))
        button.setAttributedTitle(attributedString, for: .normal)
        
        button.titleLabel?.font =  UIFont(name: "Roboto", size: 32)
        button.setTitleColor(customColor, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var button2: UIButton = {
        let button = UIButton(type: .system)
        
        let title = "Начать игру"
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: title.count))
        button.setAttributedTitle(attributedString, for: .normal)
        
        button.titleLabel?.font =  UIFont(name: "Roboto", size: 32)
        button.setTitleColor(customColor, for: .normal)
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(imageView)
        view.addSubview(label1)
        view.addSubview(label2)
        view.addSubview(button1)
        view.addSubview(button2)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
        imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 95),
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -95),
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
        
        label1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 17),
        label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        label2.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 9),
        label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),

        button1.bottomAnchor.constraint(equalTo: button2.topAnchor, constant: -40),
        button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 40),
        button2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:-80),
        button2.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func buttonPressed() {
        
    }

}


