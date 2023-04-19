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
    
    var currentSecret: Secret!

    override func viewDidLoad() {
        super.viewDidLoad()

        matherialImage.image = UIImage(named: currentSecret.image[0])
        matherialLabel.text = currentSecret.matherials[0]
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
