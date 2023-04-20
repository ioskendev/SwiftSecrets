//
//  TabBarController.swift
//  SwiftSecrets
//
//  Created by Елена Логинова on 20.04.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    var secret: Secret!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    

    private func setupViewControllers() {
        
        title = secret.title
        
        if let matherialsVC = viewControllers?.first as? MatherialsViewController {
            matherialsVC.secret = secret
        }
        if let questionsVC = viewControllers?.last as? QuestionsViewController {
            questionsVC.secret = secret
        }
    }

}
