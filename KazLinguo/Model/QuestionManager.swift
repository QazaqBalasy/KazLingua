//
//  QuestionManager.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 4/28/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import Foundation
class QuestionManager{
    
    static func parseJSON() ->  [Question]?{
        let jsonDecoder = JSONDecoder()
        if let data = readLocalFile(forName: "Data"){
            do{
                let decodedData = try jsonDecoder.decode(QuestionData.self, from: data)
                return decodedData.question
            }catch{
                print(error)
                return nil
            }
        }
        return nil
    }
    
    
    private static func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }
    
    
    static func getQuestions() -> [QuestionModel]?{
        if let questions = parseJSON(){
            var questionModel:[QuestionModel] = []
            for q in questions{
                let element = QuestionModel(type: q.type,problem: q.problem,phrase: q.phrase,answer: q.answer,variant: q.variant)
                questionModel.append(element)
            }
            return questionModel
        }
        return nil
        
    }
}
