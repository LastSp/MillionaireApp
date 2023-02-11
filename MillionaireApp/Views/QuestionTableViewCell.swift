//
//  TableViewCell.swift
//  MillionaireApp
//
//  Created by Андрей Колесников on 06.02.2023.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    
    static let identifier = "QuestionTableViewCell"
    
    private lazy var backgroundImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "pink_background"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var questionNumberLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var prizeNumberLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let gradientLayer = CAGradientLayer()
    
    //MARK: - Functions
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpCell()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 5, right: 0))
        //applyGradients()

    }
    
    
    //set up cell ui
    private func setUpCell() {
        backgroundColor = .clear
        contentView.layer.cornerRadius = 15
        layer.masksToBounds = true
        self.contentMode = .center
        contentView.addSubview(backgroundImageView)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            backgroundImageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            backgroundImageView.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
        
        contentView.addSubview(questionNumberLabel)
        
        NSLayoutConstraint.activate([
            questionNumberLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15),
            questionNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
        
        contentView.addSubview(prizeNumberLabel)

        NSLayoutConstraint.activate([
            prizeNumberLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15),
            prizeNumberLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        
    }
    
    
    //create gradient
    private func applyGradients() {
        let gradient = CAGradientLayer()
        let colorTop = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).cgColor
        let colorBottom = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1).cgColor
        
        gradient.colors = [colorTop, colorBottom, colorTop]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.cornerRadius = 15
        gradient.frame = contentView.bounds
        
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func configure(currentNumberQuestion: String, currentPriceQuestion: String) {
        
        questionNumberLabel.text = "Вопрос \(currentNumberQuestion)"
        prizeNumberLabel.text = "\(currentPriceQuestion) RUB"
        if currentNumberQuestion == "5" || currentNumberQuestion == "10" {
            backgroundImageView.image = UIImage(named: "normal_background")
        }
        if currentNumberQuestion == "15" {
            backgroundImageView.image = UIImage(named: "yellow_background")
            prizeNumberLabel.text = "1 Миллион"
        }
        setNeedsLayout()
    }
    
    func changeBackground(isTrue: Bool) {
        if isTrue {
            backgroundImageView.image = UIImage(named: "true_background")
        }
        else {
            backgroundImageView.image = UIImage(named: "false_background")
        }
    }
    
}
