//
//  DeveloperCell.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 26.04.2023.
//

import UIKit

final class DevelopersCell: UICollectionViewCell {
    
    @IBOutlet weak var developerImageView: UIImageView!
    @IBOutlet weak var developerLabel: UILabel!
    
}

extension DevelopersCell {
    
    func configure(with developer: String) {
        developerImageView.image = UIImage(named: developer)
        developerLabel.text = developer
        developerImageView.layer.cornerRadius = 10
    }
    
}
