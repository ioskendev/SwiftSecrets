//
//  QuestionsViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 12.04.2023.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBOutlet var questionButton: UIButton!
    
    var secret: Secret!
    
    var questionIndex = 0
    
    var question: Question {
        secret.questions[questionIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        secret.result = 0
        
        showQuestion()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        guard questionIndex < secret.questions.count else { return }
        
        if sender.tag == question.best {
            secret.result += 1
        }
        
        questionIndex += 1
        
        showQuestion()
    }
    
    func showQuestion() {
        questionButton.setTitle(question.title, for: .normal)
        
        for (button, answer) in zip(answerButtons, question.answers) {
            button.setTitle(answer, for: .normal)
        }
    }
   
}
