//
//  CustomButtonView.swift
//  MillionaireApp
//
//  Created by Никита Ясеник on 07.02.2023.
//

import Foundation
import UIKit

class CustomButtonView: UIView {
    
    var image: UIImage? = nil {
        willSet {
            if let currentImage = button.subviews.first {
                currentImage.removeFromSuperview()
            }
            reloadImage(image: newValue ?? UIImage())
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func reloadImage(image: UIImage) {
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leftAnchor.constraint(equalTo: button.leftAnchor),
            imageView.topAnchor.constraint(equalTo: button.topAnchor),
            imageView.rightAnchor.constraint(equalTo: button.rightAnchor),
            imageView.bottomAnchor.constraint(equalTo: button.bottomAnchor)
        ])
    }
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(button)
        return button
    }()
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: self.topAnchor),
            button.leftAnchor.constraint(equalTo: self.leftAnchor),
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
    }
}


