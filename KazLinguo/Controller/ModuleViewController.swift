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
    private let tController:TextViewController
    //private let q = QuestionPictureViewController()
    var questions = QuestionManager.getQuestions()
    private var counter:Int = 0
    
    init() {
        self.questionPic = QuestionPictureViewController()
        self.tController = TextViewController()
        super.init(nibName: nil, bundle: nil)
        
        
    }
    
    required init?(coder a: NSCoder) {
        self.questionPic = QuestionPictureViewController()
        self.tController = TextViewController()
        super.init(coder: a)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let questions = questions{
            //print("type",questions[counter].type)
            loadSubviews(type:questions[counter].type)
        }


    }
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        counter+=1
        if let questions = questions{
            loadSubviews(type:questions[counter].type)
        }
    }
    
    
    func loadSubviews(type:Int){
        let frame = CGRect(
            x: 0,
            y: 0,
            width: self.containerView.frame.width,
            height: self.containerView.frame.height
        )
        if let questions = questions{
            if(type == 1){
                //                //print("a"
                //                //print("type")
                //                print(questions[counter])
                if(questionPic.isViewLoaded){
                    DispatchQueue.main.async {
                        self.questionPic.setAttributes(
                            img1: questions[self.counter].answer,
                            img2: questions[self.counter].variant[0],
                            img3: questions[self.counter].variant[1],
                            img4: questions[self.counter].variant[2]
                        )
                    }
                    
                }
                self.questionPic.view.frame = frame
                self.containerView.addSubview(questionPic.view)
            }else if(type == 2){
                //print("b")
                tController.l1 = [questions[counter].answer]
                tController.l2 = questions[counter].variant
                self.tController.view.frame = frame
                self.containerView.addSubview(tController.view)
            }
        }
        
    }
    
    
    func insertSubview() {
        self.containerView.addSubview(tController.view)
    }
    
    
    
    
}

//MARK: - AnswerDelegate

extension ModuleViewController:AnswerDelegate{
    func didAnswered(answer: String) {
        self.answer = answer;
    }
    
      
}
