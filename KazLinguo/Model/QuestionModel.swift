//
//  QuestionModel.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 4/28/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import Foundation
struct QuestionModel {
    let type:Int
    let problem:String
    let phrase:String
    let answer:String
    let variant:[String]
    
}


extension QuestionModel{
    init(questionData: [String:Any]) {
        type = questionData["type"] as? Int ?? -1
        problem = questionData["problem"] as? String ?? " "
        phrase = questionData["phrase"] as? String ?? " "
        answer = questionData["answer"] as? String ?? " "
        variant = questionData["variant"] as? [String] ?? []
    }
}
