//
//  MakeElement.swift
//  Quiz
//
//  Created by Nikolai Maksimov on 26.12.2023.
//

import UIKit

class MakeElement {
    
    typealias Axis = NSLayoutConstraint.Axis
    typealias Alignment = UIStackView.Alignment
    typealias Distribution = UIStackView.Distribution
    
    // MARK: make label
    static func makeLabelView(withChar text: String, size: CGFloat ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
        label.font = .systemFont(ofSize: size)
        return label
    }
    
    // MARK: make button
    static func makeButtonView(withTitle title: String, type: UIButton.Configuration? = nil) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = type == nil ? .filled() : type
        button.configuration?.title = title
        return button
    }
    
    // MARK: make stack view
    static func makeStackView(axis: Axis, alignment: Alignment, distribution: Distribution, spacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.alignment = .center
        stackView.distribution = distribution
        stackView.spacing = spacing
        return stackView
    }
    
    // MARK: make progress view
    static func makeProgressView() -> UIProgressView {
        let progressView = UIProgressView()
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.progress = 0.5
        return progressView
    }
    
    // MARK: make switch iew
    static func makeSwitchView() -> UISwitch {
        let switchView = UISwitch()
        switchView.translatesAutoresizingMaskIntoConstraints = false
        switchView.isOn = true
        return switchView
    }
    
    // MARK: make slider view
    static func makeSliderView() -> UISlider {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }
}
