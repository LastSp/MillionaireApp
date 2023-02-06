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
    
    let questionNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Вопрос 10"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let prizeNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "500000 RUB"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 14)
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
        applyGradients()

    }
    
    
    //set up cell ui
    private func setUpCell() {
        backgroundColor = .clear
        contentView.layer.cornerRadius = 15
        layer.masksToBounds = true
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
    
    
}
