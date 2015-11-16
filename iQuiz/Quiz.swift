//
//  Quiz.swift
//  iQuiz
//
//  Created by Morgan Evans on 11/15/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import Foundation

struct Question {
    var question:String
    var answers: [String]
    var correctAnswer: String
    
    init(question:String, answers:[String], correctAnswer:String) {
        self.question = question
        self.answers = answers
        self.correctAnswer = correctAnswer
    }
}