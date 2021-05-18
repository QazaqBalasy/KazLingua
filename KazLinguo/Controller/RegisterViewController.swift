//
//  RegisterViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 5/14/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit
import Firebase
class RegisterViewController: ViewController {
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var pass2Field: UITextField!
    
    let db =  Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        
        if(!didMeetRules()){
            return
        }
        
        Auth.auth().createUser(withEmail: emailField.text!, password: passField.text!) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
                self.showAlert(message: e.localizedDescription)
                return
            }else {
            }
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            if(self.createUsersCollection()){
                self.performSegue(withIdentifier: "RegisterToMain", sender: self)
            }
        }
    }
    
    
    
    func createUsersCollection() -> Bool {
        
        db.collection("users").addDocument(data: [
            "Uid":Auth.auth().currentUser?.uid,
            "First Name":firstNameField.text!,
            "Last Name":lastNameField.text!
        ]) { (error) in
            if let e = error {
                print("There was an issue saving data to firestore, \(e.localizedDescription)")
                self.showAlert(message: e.localizedDescription)
                return
            }else{
                print("Successfuly saved data.")
            }
            
        }
        
        K.User.email = emailField.text!
        K.User.firstName = firstNameField.text!
        K.User.lastName = lastNameField.text!

        return true
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func didMeetRules() -> Bool {
        if(emailField.text!.isEmpty || firstNameField.text!.isEmpty || lastNameField.text!.isEmpty || passField.text!.isEmpty || pass2Field.text!.isEmpty){
            showAlert(message: "Fill out all the fields")
            return false
        };if(!(emailField.text?.contains("@"))!){
            showAlert(message: "Email address is wrong")
            return false
        };
        if(passField.text != pass2Field.text){
            showAlert(message: "Passwords do not match!")
            return false
        };
        if(passField.text!.count < 8){
            showAlert(message: "Password is too short")
            return false
        }
        return true
    }
    
}
