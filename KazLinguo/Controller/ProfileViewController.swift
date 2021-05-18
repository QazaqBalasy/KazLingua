//
//  ProfileViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 5/14/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit
import Firebase
class ProfileViewController: ViewController {
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.navigationItem.hidesBackButton = true
        firstNameLabel.text = K.User.firstName
        lastNameLabel.text = K.User.lastName
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @IBAction func logOutPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do{
            try firebaseAuth.signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@",signOutError);
        }
    }
    

}
