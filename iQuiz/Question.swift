//
//  Question.swift
//  iQuiz
//
//  Created by Yuyang Fan on 11/10/15.
//  Copyright © 2015 Yuyang Fan. All rights reserved.
//

import Foundation

class Question {
    var question: String = ""
    var correctAnswer: String = ""
    var answers: [String]
    
    init(question: String, correctAnswer: String, answers: [String]) {
        self.question = question
        self.correctAnswer = correctAnswer
        self.answers = answers
    }
}