//
//  SwiftSecretsModel.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 12.04.2023.
//

import Foundation

struct Secret {
    let title: String
    let image: [String]
    let matherials: [String]
    let questions: [Question]
    var result = 0
}

struct Question {
    let title: String
    let answers: [String]
    let best: Int
}
