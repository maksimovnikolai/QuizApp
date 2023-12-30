//
//  IntroductionView.swift
//  Quiz
//
//  Created by Nikolai Maksimov on 26.12.2023.
//

import UIKit

final class IntroductionView: UIView {
    
    // MARK: Public properties
    lazy var dogLabel = MakeElement.makeLabelView(withChar: "🐶", size: 30)
    lazy var catLabel = MakeElement.makeLabelView(withChar: "🐱", size: 30)
    lazy var rabbitLabel = MakeElement.makeLabelView(withChar: "🐰", size: 30)
    lazy var turtleLabel = MakeElement.makeLabelView(withChar: "🐢", size: 30)
    lazy var textLabel = MakeElement.makeLabelView(withChar: "Какое вы животное?", size: 30)
    lazy var startButton = MakeElement.makeButtonView(withTitle: "Начать опрос")
    lazy var stackView = MakeElement.makeStackView(axis: .vertical, alignment: .center, distribution: .fill, spacing: 16)
    
    
    // MARK: Init
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
        backgroundColor = .systemBackground
        [dogLabel, catLabel, rabbitLabel, turtleLabel, stackView].forEach { addSubview($0) }
        setupConstraintsForDogLabel()
        setupConstraintsForCatLabel()
        setupConstraintsForRabbitLabel()
        setupConstraintsForTurtleLabel()
        configureStackView()
    }
    
    private func configureStackView() {
        stackView.addArrangedSubview(textLabel)
        stackView.addArrangedSubview(startButton)
        setupConstraintsForStackView()
        
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
    
    private func setupConstraintsForStackView() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
}
