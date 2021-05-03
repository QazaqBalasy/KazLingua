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
    @IBOutlet weak var imageV: UIImageView!
    
    //@IBOutlet weak var label: UILabel!
    
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
        //imageV.image = UIImage.init(named: "img4")
        //setAttributes()
        // Do any additional setup after loading the view.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(false)
//        
//    }

    func setAttributes(img1:String,img2:String,img3:String,img4:String) {
        b1.setImage(UIImage.init(named: img1), for: UIControl.State.normal)
        b2.setImage(UIImage.init(named: img2), for: UIControl.State.normal)
        b3.setImage(UIImage.init(named: img3), for: UIControl.State.normal)
        b4.setImage(UIImage.init(named: img4), for: UIControl.State.normal)
        
        //label = questionLabel
    }
    
    
    func setAttributes()  {
        //imageV.image = UIImage.init(named: "img4")
//        b1.setImage(UIImage.init(named: "img1"), for: UIControl.State.normal)
//               b2.setImage(UIImage.init(named: "img2"), for: UIControl.State.normal)
//               b3.setImage(UIImage.init(named: "img3"), for: UIControl.State.normal)
//               b4.setImage(UIImage.init(named: "img4"), for: UIControl.State.normal)
        
    }
    
    
    
}

//extension UIImage {
//    // Instantiates a `UIImage` from the `ImageName` provided
//    convenience init(named imageName: ImageName) {
//        self.init(named: imageName.rawValue)!
//    }
//    
//    enum ImageName: String {
//        case imageName = "ImageName"
//        case anotherImage = "Image2"
//    }
//}


