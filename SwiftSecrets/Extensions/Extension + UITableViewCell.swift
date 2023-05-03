//
//  Extension + UITableViewCell.swift
//  SwiftSecrets
//
//  Created by Елена Логинова on 24.04.2023.
//

import UIKit

extension UITableViewCell {
    
    func configure(with secret: Secret) {
        var content = defaultContentConfiguration()
        content.text = secret.title
        
        if secret.result == secret.questions.count {
            content.secondaryText = nil
            accessoryType = .checkmark
        } else {
            content.secondaryText = nil
            accessoryType = .none
        }
        
        contentConfiguration = content
    }
    
}
