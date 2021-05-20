//
//  QuestionPictureViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 4/1/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit

class QuestionPictureViewController: UIViewController, Answerable {

    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var phraseLabel: UILabel!
    
    var answer = ""
    var images:[String] = []
    var phrase = ""
    
    //@IBOutlet weak var label: UILabel!
    
    @IBAction func button1(_ sender: UIButton) {
        answer = images[0]
    }
    @IBAction func button2(_ sender: Any) {
        answer = images[1]
    }
    
    @IBAction func button3(_ sender: Any) {
        answer = images[2]
    }
    
    @IBAction func button4(_ sender: Any) {
        answer = images[3]
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        phraseLabel.text = phrase
        //imageV.image = UIImage.init(named: "img4")
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        setAttributes()
        
    }

    
    func setAttributes(img1:String,img2:String,img3:String,img4:String) {
        b1.setImage(UIImage.init(named: img1), for: UIControl.State.normal)
        b2.setImage(UIImage.init(named: img2), for: UIControl.State.normal)
        b3.setImage(UIImage.init(named: img3), for: UIControl.State.normal)
        b4.setImage(UIImage.init(named: img4), for: UIControl.State.normal)
        
        //label = questionLabel
    }
    
    
    func setAttributes()  {
        b1.setImage(UIImage.init(named: images[0]), for: UIControl.State.normal)
        b2.setImage(UIImage.init(named: images[1]), for: UIControl.State.normal)
        b3.setImage(UIImage.init(named: images[2]), for: UIControl.State.normal)
        b4.setImage(UIImage.init(named: images[3]), for: UIControl.State.normal)
    }
    
    
    func getAnswer() -> String {
        return answer
    }
    

    
    
}



