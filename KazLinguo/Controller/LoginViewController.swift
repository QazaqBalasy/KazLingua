//
//  LoginViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 5/14/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit
import Firebase
class LoginViewController: ViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginPressed(_ sender: Any) {
        if(!didMeetRules()){
            return
        }
        
        if let email = emailField.text , let password = passField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error{
                    self.showAlert(message: e.localizedDescription)
                }else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        self.setUserData()
                    }
                    self.performSegue(withIdentifier: "LoginToMain", sender: self);
                }
                
            }
        }
    }
    
    func setUserData(){
        self.db.collection("users").whereField("Uid", in: [Auth.auth().currentUser!.uid]).getDocuments { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                    print(Auth.auth().currentUser!.uid)
                } else {
                    for document in querySnapshot!.documents {
                        K.User.email = self.emailField.text!
                        K.User.firstName =  document.get("First Name") as! String
                        K.User.lastName = document.get("Last Name") as! String
                        print("\(document.documentID) => \(document.data())")
                        print(K.User.firstName)
                        print(K.User.lastName)
                    }
                    print(Auth.auth().currentUser!.uid)
                }
        }
    }
    
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    
    func didMeetRules() -> Bool {
        if(emailField.text!.isEmpty ||  passField.text!.isEmpty){
            showAlert(message: "Fill out all the fields")
            return false
        };if(!(emailField.text?.contains("@"))!){
            showAlert(message: "Email address is wrong")
            return false
        };
        if(passField.text!.count < 8){
            showAlert(message: "Password is too short")
            return false
        }
        return true
    }
}
