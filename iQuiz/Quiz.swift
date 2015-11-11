//
//  Quiz.swift
//  iQuiz
//
//  Created by Yuyang Fan on 11/10/15.
//  Copyright © 2015 Yuyang Fan. All rights reserved.
//

import Foundation

class Quiz {
    var title: String = ""
    var description: String = ""
    var questions: [Question]
    
    
    init(title: String, description: String, questions: [Question]) {
        self.title = title
        self.description = description
        self.questions = questions
    }
}