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
    
    private var answerCount: Int {
        currentAnswers.count - 1
    }
    
    override func loadView() {
        view = questionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
        singleAnswerButtonPressed()
        multipleAnswerButtonPressed()
        rangedAnswerButtonPressed()
    }
    
    private func commonInit() {
        navigationController?.navigationBar.prefersLargeTitles = true
        questionView.rangedSlider.maximumValue = Float(answerCount)
        questionView.rangedSlider.value = Float(answerCount / 2)
        updateUI()
    }
}

// MARK: - Setting up custom buttons
extension QuestionsViewController {
    
    // MARK: Single Answer Button Pressed
    private func singleAnswerButtonPressed() {
        questionView.steakButton.addAction(UIAction(handler: { _ in
            self.singleAnswer(with: self.questionView.steakButton)
        }), for: .touchUpInside)
        
        questionView.fishButton.addAction(UIAction(handler: { _ in
            self.singleAnswer(with: self.questionView.fishButton)
        }), for: .touchUpInside)
        
        questionView.carrotButton.addAction(UIAction(handler: { _ in
            self.singleAnswer(with: self.questionView.carrotButton)
        }), for: .touchUpInside)
        
        questionView.cornButton.addAction(UIAction(handler: { _ in
            self.singleAnswer(with: self.questionView.cornButton)
        }), for: .touchUpInside)
    }

    private func singleAnswer(with button: UIButton) {
        guard let currentIndex = questionView.singleButtons.firstIndex(of: button) else { return }
        let currentAnswer = currentAnswers[currentIndex]
        print(currentAnswer)
        answersChosen.append(currentAnswer)
        nextQuestion()
    }
    
    // MARK: Multiple Answer Button Pressed
    private func multipleAnswerButtonPressed() {
        questionView.multipleButton.addTarget(self, action: #selector(multipleAnswer), for: .touchUpInside)
    }
    
    @objc
    private func multipleAnswer() {
        for (multipleSwitch, answer) in zip (questionView.multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answersChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    // MARK: Ranged Answer Button Pressed
    private func rangedAnswerButtonPressed() {
        questionView.rangedButton.addTarget(self, action: #selector(rangedButtonPressed), for: .touchUpInside)
    }
    
    @objc
    private func rangedButtonPressed() {
        rangedButtonChoice()
        let resultVC = ResultViewController()
        resultVC.answers = answersChosen
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    private func rangedButtonChoice() {
        let index = lrintf(questionView.rangedSlider.value)
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
}

// MARK: - Update UI
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
            showSingleStackView()
        case .multiple:
            showMultipleStackView()
        case .ranged:
            showRangedStackView(with: currentAnswers)
            break
        }
    }
    
    // ShowSingleStackView
    private func showSingleStackView() {
        questionView.singleStackView.isHidden = false
    }
    
    // ShowMultipleStackView
    private func showMultipleStackView() {
        questionView.multipleStackView.isHidden = false
    }
    
    // ShowRangedStackView
    private func showRangedStackView(with answers: [Answer]) {
        questionView.rangedStackView.isHidden = false
        questionView.rangedLeftLabel.text = answers.first?.title
        questionView.rangedRightLabel.text = answers.last?.title
    }
    
    private func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
            return
        }
    }
}
