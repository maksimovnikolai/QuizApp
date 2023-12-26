//
//  IntroductionView.swift
//  Quiz
//
//  Created by Nikolai Maksimov on 26.12.2023.
//

import UIKit

final class IntroductionView: UIView {
    
    lazy var dogLabel = MakeElement.makeLabelView(withChar: "🐶")
    lazy var catLabel = MakeElement.makeLabelView(withChar: "🐱")
    lazy var rabbitLabel = MakeElement.makeLabelView(withChar: "🐰")
    lazy var turtleLabel = MakeElement.makeLabelView(withChar: "🐢")
    lazy var textLabel = MakeElement.makeLabelView(withChar: "Какое вы животное?")
    lazy var startButton = MakeElement.makeButtonView(withTitle: "Начать опрос")
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private methods
extension IntroductionView {
    
    private func commonInit() {
        backgroundColor = .red
        [dogLabel, catLabel, rabbitLabel, turtleLabel].forEach { addSubview($0) }
        setupConstraintsForDogLabel()
        setupConstraintsForCatLabel()
        setupConstraintsForRabbitLabel()
        setupConstraintsForTurtleLabel()
    }
}

// MARK: Setup constraints
extension IntroductionView {
    
    private func setupConstraintsForDogLabel() {
        NSLayoutConstraint.activate([
            dogLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            dogLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }
    
    private func setupConstraintsForCatLabel() {
        NSLayoutConstraint.activate([
            catLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            catLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
    
    private func setupConstraintsForRabbitLabel() {
        NSLayoutConstraint.activate([
            rabbitLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            rabbitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        ])
    }
    
    private func setupConstraintsForTurtleLabel() {
        NSLayoutConstraint.activate([
            turtleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            turtleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
