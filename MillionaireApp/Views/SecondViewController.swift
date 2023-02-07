//
//  SecondViewController.swift
//  MillionaireApp
//
//  Created by Alexey Davidenko on 07.02.2023.
//

import UIKit

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
    
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background.png")!)
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
// MARK: - Outlets
    
    private lazy var imageView1: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var label: UILabel = {
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
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 10
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var imageView2: UIImageView = {
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
        view.addSubview(imageView1)
        view.addSubview(label)
        view.addSubview(textField)
        view.addSubview(button)
        view.addSubview(imageView2)
        view.addSubview(imageView3)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
        imageView1.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
        imageView1.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 95),
        imageView1.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -95),
        imageView1.heightAnchor.constraint(equalTo: imageView1.widthAnchor),

        label.topAnchor.constraint(equalTo: imageView1.bottomAnchor, constant: 17),
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 17),
        //textField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 54),
        // textField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -54),
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        textField.heightAnchor.constraint(equalToConstant: 47),
        textField.widthAnchor.constraint(equalToConstant: 261),

        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 17),
//        button.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 54),
//        button.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -54),
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        button.heightAnchor.constraint(equalToConstant: 47),
        button.widthAnchor.constraint(equalToConstant: 261),
        
        imageView2.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40),
        
        imageView3.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 10),
        imageView3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 200)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func buttonPressed() {
        
    }
    
    
    
}


