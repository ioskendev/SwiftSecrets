//
//  QuestionsViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 12.04.2023.
//

import UIKit

protocol QuestionsViewControllerDelegate {
    func resultUpdate(result: Int)
}

final class QuestionsViewController: UIViewController {
    
    @IBOutlet var answerButtons: [UIButton]!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var buttonsStack: UIStackView!
    
    var secret: Secret!
    var delegate: QuestionsViewControllerDelegate!
    
    private var currentResult = 0
    private var questionIndex = 0
    
    private var question: Question {
        secret.questions[questionIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if sender.tag == question.best {
            currentResult += 1
        }
        
        questionIndex += 1
        
        if  (0..<secret.questions.count).contains(questionIndex) {
            showQuestion()
        } else {
            buttonsStack.isHidden = true
            questionLabel.text = "Количество правильных ответов \(currentResult) из \(secret.questions.count)"
            
            if currentResult > secret.result {
                delegate.resultUpdate(result: currentResult)
            }
        }
    }
    
    private func showQuestion() {
        questionLabel.text = question.title
        
        for (button, answer) in zip(answerButtons, question.answers) {
            button.setTitle(answer, for: .normal)
        }
    }
    
}
