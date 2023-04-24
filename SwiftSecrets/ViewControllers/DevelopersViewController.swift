//
//  DevelopersViewController.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 23.04.2023.
//

import UIKit

final class DevelopersViewController: UIViewController {

    @IBOutlet var photoImageView: UIImageView!
    
    @IBOutlet var aboutLabel: UILabel!
    
    var developerName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoImageView.image = UIImage(named: developerName)
        aboutLabel.text = developerName
    }

}
