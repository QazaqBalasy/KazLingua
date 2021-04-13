//
//  QuestionPictureViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 4/1/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit

class QuestionPictureViewController: UIViewController {
    var delegate:AnswerDelegate?
    
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func button1(_ sender: UIButton) {
        delegate?.didAnswered(answer: "1")
    }
    @IBAction func button2(_ sender: Any) {
        delegate?.didAnswered(answer: "2")
    }
    
    @IBAction func button3(_ sender: Any) {
        delegate?.didAnswered(answer: "3")
    }
    
    @IBAction func button4(_ sender: Any) {
        delegate?.didAnswered(answer: "4")
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func setAttributes(image1:UIImage,image2:UIImage,image3:UIImage,image4:UIImage,questionLabel:UILabel) {
        b1.setBackgroundImage(image1, for: UIControl.State.normal)
        b2.setBackgroundImage(image2, for: UIControl.State.normal)
        b3.setBackgroundImage(image3, for: UIControl.State.normal)
        b4.setBackgroundImage(image4, for: UIControl.State.normal)
        label = questionLabel
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
