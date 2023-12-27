//
//  QuestionsViewController.swift
//  Quiz
//
//  Created by Nikolai Maksimov on 27.12.2023.
//

import UIKit

final class QuestionsViewController: UIViewController {
    
    private let questionView = QuestionView()
    
    override func loadView() {
        view = questionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
    }
}
