//
//  MakeElement.swift
//  Quiz
//
//  Created by Nikolai Maksimov on 26.12.2023.
//

import UIKit

class MakeElement {
    
    static func makeLabelView(withChar text: String) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = text
//        label.font = font
        return label
    }
    
    static func makeButtonView(withTitle title: String) -> UIButton {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.title = title
        return button
    }
}
