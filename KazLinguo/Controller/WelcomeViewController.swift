//
//  WelcomeViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 5/14/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit
import CLTypingLabel
import Firebase
let defaults = UserDefaults.standard

class WelcomeViewController: ViewController {
    @IBOutlet weak var titleLabel: CLTypingLabel!
    let db = Firestore.firestore()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "QazLinguooooo"
        titleLabel.charInterval = 0.001
        
//        db.document("chapter1").set
        getData()
        if(defaults.double(forKey: "time") == 0){
            defaults.set(Date().timeIntervalSince1970, forKey: "time")
            defaults.set(5, forKey: "livePoints")
            K.livePoints = 5;
        }else if(Date().timeIntervalSince1970 - defaults.double(forKey: "time") >= 86400.0){
            defaults.set(5, forKey: "livePoints")
            
        }
    }
    
    
    func getData()  {
        let docRef = db.collection("chapters").document("chapter1")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
               // let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                let result = document.data()
                //print(result)
                if let itData = result?["topic1"] as? [String: Any]{
                    //print(itData)
                    if let question = itData["question1"] as? [String:Any]{
                     //print(question)
                        if let field = question["phrase"] as? String{
                            print(field)
                        }
                    }
                }
                //print("Document data: \(dataDescription)")
            } else {
                print("Document does not exist")
            }
        }
    }

    

}
