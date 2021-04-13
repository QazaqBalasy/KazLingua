//
//  Question.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 4/4/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import Foundation

class Question {
    let question:String
    var answer:String = ""
    let rightAnswer:String
    
    init(question:String,answer:String,rightAnswer:String) {
        self.question = question
        self.answer = answer
        self.rightAnswer = rightAnswer
    }
    
    func isAnswerRight() -> Bool {
        if(answer == rightAnswer){
            return true
        }
        return false
    }
}
