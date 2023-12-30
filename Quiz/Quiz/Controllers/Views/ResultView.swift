//
//  ResultView.swift
//  Quiz
//
//  Created by Nikolai Maksimov on 28.12.2023.
//

import UIKit

final class ResultView: UIView {
    
    // MARK: Public properties
    lazy var vStack = MakeElement.makeStackView(axis: .vertical,
                                                alignment: .center,
                                                distribution: .fill,
                                                spacing: 8)
    lazy var animalTypeLabel = MakeElement.makeLabelView(withChar: "Вы - 🐶", size: 50)
    lazy var descriptionLabel = MakeElement.makeLabelView(withChar: "Description", size: 17)
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private methods
extension ResultView {
    
    private func commonInit() {
        backgroundColor = .systemBackground
        setupConstraintsForStackView()
        addArrangedSubiews()
        descriptionLabel.numberOfLines = 0
    }
    
    private func addArrangedSubiews() {
        [animalTypeLabel, descriptionLabel].forEach { vStack.addArrangedSubview($0) }
    }
}

// MARK: - Constraints
extension ResultView {
    private func setupConstraintsForStackView() {
        addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
