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

    
//    @IBAction func modulePressed(_ sender: Any) {
//        if(K.livePoints > 0){
//            performSegue(withIdentifier: "ToModuleView", sender: self)
//        }else{
//            showAlert(message: "You don't have enoung live points")
//        }
//    }
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: "TaskViewCell", bundle: nil), forCellReuseIdentifier: "TaskViewCell")
        }
        
    }
    
    let modules = ["Pronouns","Meeting","Food"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: animated)
        }
    }
    
    
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    

}

//MARK: - Table functions implementation

extension TaskViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modules.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskViewCell", for: indexPath)
        
        if let tableCell = cell as? TaskViewCell{
            if((indexPath.row + 1) % 2 == 1){
                tableCell.rightIV.isHidden = true
                tableCell.leftIV.image = UIImage.init(named: "img3")
                tableCell.setRoundsForLeftImage()
            }else{
                tableCell.leftIV.isHidden = true
                tableCell.rightIV.image = UIImage.init(named: "img4")
                tableCell.setRoundsForRightImage()
            }
            tableCell.label.text = modules[indexPath.row]
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected")
        if(K.livePoints > 0){
            performSegue(withIdentifier: "ToModuleView", sender: self)
        }else{
            showAlert(message: "You don't have enoung live points")
        }
        
    }
    
}
