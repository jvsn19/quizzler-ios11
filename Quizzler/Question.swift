//
//  Question.swift
//  Quizzler
//
//  Created by Joao Vasconcelos on 26/10/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation


class Question {
    let questionText : String,
        answer: Bool
    
    init(text : String, correctAnswer : Bool) {
        self.questionText = text
        self.answer = correctAnswer
    }
}
