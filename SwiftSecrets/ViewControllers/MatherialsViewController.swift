//
//  MatherialsViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 12.04.2023.
//

import UIKit

final class MatherialsViewController: UIViewController {
    
    @IBOutlet var matherialImage: UIImageView!
    @IBOutlet var matherialLabel: UILabel!
    
    var secret: Secret!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        matherialImage.image = UIImage(named: secret.image)
        matherialLabel.text = secret.matherial
    }
    
}
