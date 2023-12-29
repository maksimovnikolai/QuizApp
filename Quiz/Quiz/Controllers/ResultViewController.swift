//
//  ResultViewController.swift
//  Quiz
//
//  Created by Nikolai Maksimov on 28.12.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    
    var answers: [Answer]!
    
    private let resultView = ResultView()
    
    override func loadView() {
        view = resultView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        updateResult()
    }
    
    func configureNavBar() {
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
        var rabbitCount = 0
        var turtleCount = 0
        for answer in answers {
            switch answer.animal {
            case .dog:
                dogsCount += 1
                frequencyAnimal.updateValue(dogsCount, forKey: .dog)
            case .cat:
                catsCount += 1
                frequencyAnimal.updateValue(catsCount, forKey: .cat)
            case .rabbit:
                rabbitCount += 1
                frequencyAnimal.updateValue(rabbitCount, forKey: .rabbit)
            default:
                turtleCount += 1
                frequencyAnimal.updateValue(turtleCount, forKey: .turtle)
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
