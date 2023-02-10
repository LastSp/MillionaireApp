//
//  QuestionsViewController.swift
//  MillionaireApp
//
//  Created by Андрей Колесников on 06.02.2023.
//

import Foundation
import UIKit

class QuestionsViewController: UIViewController {

    //MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(QuestionTableViewCell.self, forCellReuseIdentifier: QuestionTableViewCell.identifier)
        return tableView
    }()
    
    private let logoImageView: UIImageView = {
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpBackgroundImage()
        setUpViews()
    }

    
    //MARK: - Functions
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.separatorColor = .clear
    }
    
    private func setUpBackgroundImage() {
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: "background")
            backgroundImage.contentMode = .scaleToFill
            self.view.insertSubview(backgroundImage, at: 0)
    }
    
    private func setUpViews() {
        view.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 10),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 20),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
}


//MARK: - UITableViewDelegate, UITableViewDataSource
extension QuestionsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
}
