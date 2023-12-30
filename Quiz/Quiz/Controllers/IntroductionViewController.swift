//
//  IntroductionViewController.swift
//  Quiz
//
//  Created by Nikolai Maksimov on 26.12.2023.
//

import UIKit

final class IntroductionViewController: UIViewController {
    
    // MARK: Private properties
    private let elementView = IntroductionView()
    
    // MARK: Life cycle
    override func loadView() {
        view = elementView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commonInit()
    }
}

// MARK: - Private methods
extension IntroductionViewController {
    
    private func commonInit() {
        elementView.startButton.addTarget(self, action: #selector(presentQuestionView), for: .touchUpInside)
    }
    
    @objc
    private func presentQuestionView() {
        let questionVC = QuestionsViewController()
        let destinationVC = UINavigationController(rootViewController: questionVC)
        destinationVC.modalPresentationStyle = .fullScreen
        present(destinationVC, animated: true)
    }
}
