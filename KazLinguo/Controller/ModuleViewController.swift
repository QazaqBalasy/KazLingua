//
//  ModuleViewController.swift
//  KazLinguo
//
//  Created by Sundet Mukhtar on 4/1/21.
//  Copyright © 2021 SKE. All rights reserved.
//

import UIKit

class ModuleViewController: UIViewController{
    
    @IBOutlet weak var containerView: UIView!
    var answer = "0";
    @IBOutlet weak var progressBar: UIProgressView!
    
    private let questionPic:QuestionPictureViewController
    
    init() {
        self.questionPic = QuestionPictureViewController()
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder a: NSCoder) {
        self.questionPic = QuestionPictureViewController()
        super.init(coder: a)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionPic.view.frame = CGRect(
            x: 0,
            y: 0,
            width: self.containerView.frame.width,
            height: self.containerView.frame.height
        )
        self.containerView.addSubview(questionPic.view)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
    }
    
    
}

//MARK: - AnswerDelegate

extension ModuleViewController:AnswerDelegate{
    func didAnswered(answer: String) {
        self.answer = answer;
    }
    
      
  }
