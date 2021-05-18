//
//  WelcomeViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 5/14/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit
import CLTypingLabel
let defaults = UserDefaults.standard

class WelcomeViewController: ViewController {
    @IBOutlet weak var titleLabel: CLTypingLabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "QazLinguooooo"
        titleLabel.charInterval = 0.001
        
        
        if(defaults.double(forKey: "time") == 0){
            defaults.set(Date().timeIntervalSince1970, forKey: "time")
            defaults.set(5, forKey: "livePoints")
            K.livePoints = 5;
        }else if(Date().timeIntervalSince1970 - defaults.double(forKey: "time") >= 86400.0){
            defaults.set(5, forKey: "livePoints")
            
        }
    }
    

    

}
