//
//  ResultViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 5/8/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import Foundation

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var button: UIButton!
    
    var lbTxt:String?
    var img:String!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = lbTxt
        imageView.image = UIImage.init(systemName: img)
        UserDefaults.standard.set(Date().timeIntervalSince1970, forKey: "time")
    }

    @IBAction func continueButtonPressed(_ sender: Any) {
        //navigationController?.popToRootViewController(animated: true)
//        navigationController?.popToViewController(parent!.parent!, animated: true)
//        navigationController?.navigationController?.popToRootViewController(animated: true)
        let viewControllers:[UIViewController] = navigationController!.viewControllers
        navigationController!.popToViewController(viewControllers[viewControllers.count - 3], animated: true)
    }
    
}
