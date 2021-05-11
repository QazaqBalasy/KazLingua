//
//  Question.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 4/4/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import Foundation

struct QuestionData:Codable {
    var question:[Question]
}

struct Question:Codable {
    let type:Int
    let problem:String
    let phrase:String
    let answer:String
    let variant:[String]
}
