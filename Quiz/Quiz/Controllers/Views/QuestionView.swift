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
}
