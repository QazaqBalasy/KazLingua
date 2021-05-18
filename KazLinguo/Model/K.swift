//
//  K.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 4/4/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import Foundation


struct K {
    private init(){}
    let defaults = UserDefaults.standard
    static let rightAnswerExclamation = "Yeah!You did it"
    static let wrongAnswerExclamation = "Don't worry!Next time!"
    static let passedModuleImg = "checkmark"
    static let failedModuleImg = "xmark"
    static var livePoints = 5;
    
    struct User {
        static var email = ""
        static var firstName = ""
        static var lastName = ""
    }
}
