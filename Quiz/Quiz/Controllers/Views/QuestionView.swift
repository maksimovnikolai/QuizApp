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
    lazy var singleStackView = MakeElement.makeStackView(axis: .vertical, alignment: .center, distribution: .fill, spacing: 16)
    lazy var steakButton = MakeElement.makeButtonView(withTitle: "Стейк", type: .plain())
    lazy var fishButton = MakeElement.makeButtonView(withTitle: "Рыба", type: .plain())
    lazy var carrotButton = MakeElement.makeButtonView(withTitle: "Морковь", type: .plain())
    lazy var cornButton =  MakeElement.makeButtonView(withTitle: "Кукуруза", type: .plain())
    
    // multipleStackView
    lazy var multipleStackView = MakeElement.makeStackView(axis: .vertical, alignment: .fill, distribution: .fillEqually, spacing: 16)
    
    lazy var swimSwitchView = MakeElement.makeSwitchView()
    lazy var sleepSwitchView = MakeElement.makeSwitchView()
    lazy var embraceSwitchView = MakeElement.makeSwitchView()
    lazy var eatSwitchView = MakeElement.makeSwitchView()
    
    private lazy var swimLabel = MakeElement.makeLabelView(withChar: "Плавать", size: 17)
    private lazy var sleepLabel = MakeElement.makeLabelView(withChar: "Спать", size: 17)
    private lazy var embraceLabel = MakeElement.makeLabelView(withChar: "Обниматься", size: 17)
    private lazy var eatLabel = MakeElement.makeLabelView(withChar: " Кушать", size: 17)
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Methods
extension QuestionView {
    
    private func commonInit() {
        configureSingleStackView()
        configureMultipleArrangedStackView()
        configureMultipleStackView()
        setupConstraintsFor(labels: [swimLabel, sleepLabel, embraceLabel, eatLabel])
    }
    
    private func configureSingleStackView() {
        [
            steakButton,
            fishButton,
            carrotButton,
            cornButton
        ].forEach { singleStackView.addArrangedSubview($0) }
        setupConstraintsForSingleStackView()
    }
    
    private func configureMultipleArrangedStackView() {
        let firstHStack = getArrangedSubView(views: [swimLabel, swimSwitchView])
        let secondHStack = getArrangedSubView(views: [sleepLabel, sleepSwitchView])
        let thirdHStack = getArrangedSubView(views: [embraceLabel, embraceSwitchView])
        let fourthHStack = getArrangedSubView(views: [eatLabel, eatSwitchView])
        
        [firstHStack, secondHStack, thirdHStack, fourthHStack].forEach { multipleStackView.addArrangedSubview($0) }
    }
    
    private func configureMultipleStackView() {
        setupConstraintsForMultipleStackView()
    }
    
    private func getArrangedSubView(views: [UIView]) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        views.forEach { stackView.addArrangedSubview($0) }
        return stackView
    }
    
}

// MARK: Constraints
extension QuestionView {
    
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
    
    private func setupConstraintsFor(labels: [UILabel]) {
        labels.forEach {
            NSLayoutConstraint.activate([
                $0.widthAnchor.constraint(equalToConstant: 300)
            ])
        }
    }
}
