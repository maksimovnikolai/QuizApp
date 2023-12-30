//
//  ResultViewController.swift
//  Quiz
//
//  Created by Nikolai Maksimov on 28.12.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: Public properties
    var answers: [Answer]!
    
    // MARK: Private properties
    private let resultView = ResultView()
    
    // MARK: Life cycle
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       commonInit()
    }
}

// MARK: - Private methods
extension ResultViewController {
    
    private func commonInit() {
        configureNavBar()
        updateResult()
    }
    
    private func configureNavBar() {
        title = "Результат"
        navigationItem.hidesBackButton = true
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(popToRoot))
        navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc
    private func popToRoot() {
        dismiss(animated: true)
    }
    
    private func updateResult() {
        var frequencyAnimal: [Animal: Int] = [:]
        var dogsCount = 0
        var catsCount = 0
        var rabbitsCount = 0
        var turtlesCount = 0
        for answer in answers {
            switch answer.animal {
            case .dog:
                dogsCount += 1
                frequencyAnimal.updateValue(dogsCount, forKey: .dog)
            case .cat:
                catsCount += 1
                frequencyAnimal.updateValue(catsCount, forKey: .cat)
            case .rabbit:
                rabbitsCount += 1
                frequencyAnimal.updateValue(rabbitsCount, forKey: .rabbit)
            default:
                turtlesCount += 1
                frequencyAnimal.updateValue(turtlesCount, forKey: .turtle)
            }
        }
        print(frequencyAnimal)
        updateUI(from: frequencyAnimal)
    }
    
    private func updateUI(from dict: [Animal: Int]) {
        if let mostFrequencyAnimal = dict.max(by: { $0.value < $1.value }) {
            resultView.animalTypeLabel.text = "Вы - \(mostFrequencyAnimal.key.rawValue)"
            resultView.descriptionLabel.text = "\(mostFrequencyAnimal.key.definition)"
        }
    }
}
