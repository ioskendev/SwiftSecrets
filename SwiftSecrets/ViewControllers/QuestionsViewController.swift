//
//  QuestionsViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 12.04.2023.
//

import UIKit

final class QuestionsViewController: UIViewController {
    
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBOutlet var questionButton: UIButton!
    
    @IBOutlet var buttonsStack: UIStackView!
    
    var secret: Secret!
    
    private var questionIndex = 0
    
    private var question: Question {
        secret.questions[questionIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secret.result = 0
        
        showQuestion()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        if sender.tag == question.best {
            secret.result += 1
        }
        
        questionIndex += 1
        
        if  (0..<secret.questions.count).contains(questionIndex) {
            showQuestion()
        } else {
            buttonsStack.isHidden = true
            questionButton.setTitle("Количество верных ответов \(secret.result) из 3", for: .normal)
        }
    }
    
    private func showQuestion() {
        questionButton.setTitle(question.title, for: .normal)
        
        for (button, answer) in zip(answerButtons, question.answers) {
            button.setTitle(answer, for: .normal)
        }
    }
    
}
