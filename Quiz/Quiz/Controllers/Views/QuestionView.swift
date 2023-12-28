//
//  QuestionView.swift
//  Quiz
//
//  Created by Nikolai Maksimov on 27.12.2023.
//

import UIKit

final class QuestionView: UIView {
    
    lazy var progressView = MakeElement.makeProgressView()
    lazy var questionLabel = MakeElement.makeLabelView(withChar: "Вопрос", size: 20)
    
    // singleStackView
    lazy var singleStackView = MakeElement.makeStackView(axis: .vertical,
                                                         alignment: .center,
                                                         distribution: .fill,
                                                         spacing: 16)
    
    lazy var steakButton = MakeElement.makeButtonView(withTitle: "Стейк", type: .plain())
    lazy var fishButton = MakeElement.makeButtonView(withTitle: "Рыба", type: .plain())
    lazy var carrotButton = MakeElement.makeButtonView(withTitle: "Морковь", type: .plain())
    lazy var cornButton =  MakeElement.makeButtonView(withTitle: "Кукуруза", type: .plain())
    
    // multipleStackView
    lazy var multipleStackView = MakeElement.makeStackView(axis: .vertical,
                                                           alignment: .fill,
                                                           distribution: .fill,
                                                           spacing: 16)
    
    lazy var swimLabel = MakeElement.makeLabelView(withChar: "Плавать", size: 17)
    lazy var sleepLabel = MakeElement.makeLabelView(withChar: "Спать", size: 17)
    lazy var embraceLabel = MakeElement.makeLabelView(withChar: "Обниматься", size: 17)
    lazy var eatLabel = MakeElement.makeLabelView(withChar: "Кушать", size: 17)
    
    lazy var multipleButton = MakeElement.makeButtonView(withTitle: "Ответить")
    
    lazy var swimSwitchView = MakeElement.makeSwitchView()
    lazy var sleepSwitchView = MakeElement.makeSwitchView()
    lazy var embraceSwitchView = MakeElement.makeSwitchView()
    lazy var eatSwitchView = MakeElement.makeSwitchView()
    
    // rangedStackView
    lazy var rangedStackView = MakeElement.makeStackView(axis: .vertical,
                                                         alignment: .firstBaseline,
                                                         distribution: .fill,
                                                         spacing: 16)
    
    lazy var rangedSlider = MakeElement.makeSliderView()
    lazy var rangedLeftLabel = MakeElement.makeLabelView(withChar: "leftLabel", size: 17)
    lazy var rangedRightLabel = MakeElement.makeLabelView(withChar: "rightLabel", size: 17)
    lazy var rangedButton = MakeElement.makeButtonView(withTitle: "Ответить")
    
    
    //MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Methods
extension QuestionView {
    
    private func commonInit() {
        setupConstraintsForProgressView()
        setupConstraintsQuestionLabel()
        configureSingleStackView()
        configureMultipleStackView()
        setupConstraintsFor(labels: [swimLabel, sleepLabel, embraceLabel, eatLabel])
        setupConstraintsForRangedStackView()
        configureRangedStackView()
    }
    
    private func configureSingleStackView() {
        [steakButton, fishButton,
         carrotButton, cornButton].forEach { singleStackView.addArrangedSubview($0) }
        setupConstraintsForSingleStackView()
    }
    
    private func configureMultipleStackView() {
        setupConstraintsForMultipleStackView()
        let firstHStack = getArrangedSubView(views: [swimLabel, swimSwitchView])
        let secondHStack = getArrangedSubView(views: [sleepLabel, sleepSwitchView])
        let thirdHStack = getArrangedSubView(views: [embraceLabel, embraceSwitchView])
        let fourthHStack = getArrangedSubView(views: [eatLabel, eatSwitchView])
        
        [firstHStack, secondHStack, thirdHStack,
         fourthHStack, multipleButton].forEach { multipleStackView.addArrangedSubview($0) }
    }
    
    private func configureRangedStackView() {
        let labelsStack = getArrangedSubView(views: [rangedLeftLabel, rangedRightLabel])
        [rangedSlider, labelsStack, rangedButton].forEach { rangedStackView.addArrangedSubview($0) }
        labelsStack.leadingAnchor.constraint(equalTo: rangedStackView.leadingAnchor, constant: 5).isActive = true
        labelsStack.trailingAnchor.constraint(equalTo: rangedStackView.trailingAnchor, constant: -5).isActive = true
        setupConstraintsForSliderView()
    }
    
    private func getArrangedSubView(views: [UIView]) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        
        views.forEach { stackView.addArrangedSubview($0) }
        return stackView
    }
}

// MARK: - Constraints
extension QuestionView {
    
    private func setupConstraintsForProgressView() {
        addSubview(progressView)
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func setupConstraintsQuestionLabel() {
        addSubview(questionLabel)
        NSLayoutConstraint.activate([
            questionLabel.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 5),
            questionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }
    
    private func setupConstraintsForSingleStackView() {
        addSubview(singleStackView)
        NSLayoutConstraint.activate([
            singleStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            singleStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            singleStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func setupConstraintsForMultipleStackView() {
        addSubview(multipleStackView)
        NSLayoutConstraint.activate([
            multipleStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            multipleStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            multipleStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func setupConstraintsForRangedStackView() {
        addSubview(rangedStackView)
        NSLayoutConstraint.activate([
            rangedStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            rangedStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            rangedStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func setupConstraintsForSliderView() {
        NSLayoutConstraint.activate([
            rangedSlider.leadingAnchor.constraint(equalTo: rangedStackView.leadingAnchor, constant: 5),
            rangedSlider.trailingAnchor.constraint(equalTo: rangedSlider.trailingAnchor, constant: -5),
        ])
    }
    
    private func setupConstraintsFor(labels: [UILabel]) {
        labels.forEach {
            NSLayoutConstraint.activate([
                $0.widthAnchor.constraint(equalToConstant: 300)
            ])
        }
    }
}
