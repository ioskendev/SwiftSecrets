//
//  DataStore.swift
//  SwiftSecrets
//
//  Created by Yuri Volegov on 12.04.2023.
//

import Foundation

final class DataStore {
    static var share = DataStore()
    private init() {}
}

extension DataStore {
    func getSecrets() -> [Secret] {
        [
            Secret(
                title: "Delegate",
                image: [""],
                matherials: [""],
                questions: [
                    Question(
                        title: "",
                        answers: [""],
                        best: 0
                    ),
                    Question(
                        title: "",
                        answers: [""],
                        best: 0
                    ),
                    Question(
                        title: "",
                        answers: [""],
                        best: 0
                    )
                ]
            ),
            Secret(
                title: "CoreData",
                image: [""],
                matherials: [""],
                questions: [
                    Question(
                        title: "",
                        answers: [""],
                        best: 0
                    ),
                    Question(
                        title: "",
                        answers: [""],
                        best: 0
                    ),
                    Question(
                        title: "",
                        answers: [""],
                        best: 0
                    )
                ]
            )
            
        ]
        
    }
}
