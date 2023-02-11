//
//  QuestionsViewController.swift
//  MillionaireApp
//
//  Created by Андрей Колесников on 06.02.2023.
//

import Foundation
import UIKit


class QuestionsViewController: UIViewController {
    
    var currentNickname: String? = nil
    var questions = QuestionModel().getAllQuestions()
    var curentIndexPath: Int = 1
    var currentNumberQuestion: Int = 1 {
        willSet {
            updateBackgroundCell(currentIndex: newValue, userIsTrue: trueAns!)
            goToNextQuestion()
        }
    }
    var trueAns: Bool? = nil

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
    
    func goToNextQuestion() {
        Timer.scheduledTimer(withTimeInterval: 5,
                                     repeats: false, block: {[self] _ in
            let answerVC = AnswersViewController()
            answerVC.currentNickname = currentNickname
            answerVC.modalPresentationStyle = .fullScreen
            answerVC.questionViewController = self
            answerVC.currentNumberQuestion = currentNumberQuestion
            self.present(answerVC, animated: true)
        })
    }
    
    //MARK: - ViewDidLoad()
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setUpBackgroundImage()
        setUpViews()
        goToNextQuestion()
        
    }
    //MARK: - Functions
    
    private func setUpTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.separatorColor = .clear
        tableView.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        tableView.allowsSelection = false
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
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionTableViewCell.identifier, for: indexPath) as? QuestionTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .default
        cell.configure(currentNumberQuestion: "\(self.curentIndexPath)",
                       currentPriceQuestion: "\(sumsForQuestions[self.curentIndexPath]!)")
        self.curentIndexPath += 1
        cell.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = view.backgroundColor
        return headerView
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    func updateBackgroundCell(currentIndex: Int, userIsTrue: Bool) {
        let cell = tableView.cellForRow(at: IndexPath(item: 0, section: currentIndex - 2)) as? QuestionTableViewCell
        cell?.changeBackground(isTrue: userIsTrue)
    }
    
}
