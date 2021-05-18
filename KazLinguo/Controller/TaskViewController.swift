//
//  TaskViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 5/14/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit
import Firebase
class TaskViewController: ViewController {

    
    @IBAction func modulePressed(_ sender: Any) {
        if(K.livePoints > 0){
            performSegue(withIdentifier: "ToModuleView", sender: self)
        }else{
            showAlert(message: "You don't have enoung live points")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    

}
