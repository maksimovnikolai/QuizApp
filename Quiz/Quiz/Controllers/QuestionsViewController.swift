//
//  QuestionsViewController.swift
//  Quiz
//
//  Created by Nikolai Maksimov on 27.12.2023.
//

import UIKit

final class QuestionsViewController: UIViewController {
    
    private let questionView = QuestionView()
    
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var answersChosen: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    override func loadView() {
        view = questionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
        singleAnswerButtonPressed()
    }
    
    private func commonInit() {
        navigationController?.navigationBar.prefersLargeTitles = true
        addTarget()
        updateUI()
    }
}


// MARK: Private methods
extension QuestionsViewController {
    
    private func addTarget() {
        questionView.rangedButton.addTarget(self, action: #selector(showResultVC), for: .touchUpInside)
    }
    
    @objc
    private func showResultVC() {
        let resultVC = ResultViewController()
        resultVC.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(resultVC, animated: true)
    }
}

// MARK: -
extension QuestionsViewController {
    
    private func singleAnswerButtonPressed() {
        questionView.singleButtons.forEach { button in
            
            switch button {
            case questionView.steakButton:
                button.addTarget(self, action: #selector(choose), for: .touchUpInside)
            case questionView.fishButton:
                button.addTarget(self, action: #selector(choose), for: .touchUpInside)
            case questionView.carrotButton:
                button.addTarget(self, action: #selector(choose), for: .touchUpInside)
            case questionView.cornButton:
                button.addTarget(self, action: #selector(choose), for: .touchUpInside)
            default:
                break
            }
        }
    }
    
    @objc
    private func choose() {
        guard let currentIndex = questionView.singleButtons.firstIndex(of: questionView.singleButtons.first ?? UIButton()) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        answersChosen.append(currentAnswer)
        nextQuestion()
    }

}

extension QuestionsViewController {
    
    // Update UI
    private func updateUI() {
        
        [questionView.singleStackView, questionView.multipleStackView,
         questionView.rangedStackView].forEach { $0.isHidden = true }
        
        let currentQuestion = questions[questionIndex]
        questionView.questionLabel.text = currentQuestion.title
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionView.progressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion.responseType)
    }
    
    // ShowCurrentAnswers
    private func showCurrentAnswers(for type: ResponseType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiple:
            break
        case .ranged:
            break
        }
    }
    
    // ShowSingleStackView
    private func showSingleStackView(with answers: [Answer]) {
        questionView.singleStackView.isHidden = false
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
        // переход
    }
}


