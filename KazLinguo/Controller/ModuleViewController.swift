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
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var lifePoint: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var directiveLabel: UILabel!
    
    private var chooseRightPictureVC:QuestionPictureViewController
    private var arrangeTextVC:TextViewController
    
    private var questions = QuestionManager.getQuestions()
    private var counter:Int = 0
    private var answer = "";
    private var pointsLeft = 5;
    private var status = false;
    
    
    init() {
        self.chooseRightPictureVC = QuestionPictureViewController()
        self.arrangeTextVC = TextViewController()
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder a: NSCoder) {
        self.chooseRightPictureVC = QuestionPictureViewController()
        self.arrangeTextVC = TextViewController()
        super.init(coder: a)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        result.isHidden = true
        updateSubview()
    }
    
    
    @IBAction func closeButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        if(pointsLeft <= 0 || questions?.count ?? 0 <= counter + 1){
            self.performSegue(withIdentifier:"ToResultView", sender:self)
        }
        if(status){
            result.isHidden = true
            counter+=1
            updateSubview()
            print("Status:1")
            status = false
        }else if(!status){
            updateProgress()
            status = true
            print("Status:2")
            result.isHidden = false
        }
        
    }
    
    
    func updateSubview(){
        if let questions = questions{
            let typeOfTask = questions[counter].type
            directiveLabel.text = questions[counter].problem
            if(typeOfTask == 1){
                remove(asChildViewController: chooseRightPictureVC)
                remove(asChildViewController: arrangeTextVC)
                self.chooseRightPictureVC = QuestionPictureViewController()
                self.chooseRightPictureVC.phrase = questions[self.counter].phrase
                self.chooseRightPictureVC.images = questions[self.counter].variant
                self.chooseRightPictureVC.images.insert(questions[self.counter].answer, at: 0)
                self.add(asChildViewController: self.chooseRightPictureVC)
            }else if(typeOfTask == 2){
                remove(asChildViewController: arrangeTextVC)
                remove(asChildViewController: chooseRightPictureVC)
                arrangeTextVC = TextViewController()
                arrangeTextVC.phrase = questions[counter].phrase
                arrangeTextVC.l1 = [""]
                arrangeTextVC.l2 = questions[counter].variant
                add(asChildViewController: arrangeTextVC)
            }
        }
        
    }
    
    
    func updateProgress() {
        result.isHidden = false
        if(isAnswerRight()){
            result.text = "Right!"
            updateProgressBar()
        }else{
            pointsLeft-=1
            lifePoint.text = String(pointsLeft)
            result.text = "Wrong!Answer: \(questions![counter].answer)"
        }
    }
    
    
    func isAnswerRight() -> Bool{
        if let questions = questions{
            answer = questions[counter].answer
            let controller:Answerable = (questions[counter].type == 1) ? chooseRightPictureVC : arrangeTextVC
            if(answer == controller.getAnswer()){
                return true
            }else {
                self.questions!.append(questions[counter])
                return false
            }
        }
        return false
    }
    
    
    private func updateProgressBar(){
        if let questions = questions{
            progressBar.progress = progressBar.progress + (1.0/Float(questions.count))
        }
    }
    
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "ToResultView"){
            let destinationVC = segue.destination as! ResultViewController
            if(pointsLeft <= 0){
                destinationVC.lbTxt = K.wrongAnswerExclamation
                destinationVC.img = K.failedModuleImg
            }else{
                destinationVC.lbTxt = K.rightAnswerExclamation
                destinationVC.img = K.passedModuleImg
            }
        }
        
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        // Add Child View Controller
        addChild(viewController)

        // Add Child View as Subview
        containerView.addSubview(viewController.view)

        // Configure Child View
        viewController.view.frame = CGRect(
            x: 0,y: 0,
            width: self.containerView.frame.width,
            height: self.containerView.frame.height
        )
        //viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child View Controller
        viewController.didMove(toParent: self)
    }
    
    
    private func remove(asChildViewController viewController: UIViewController) {
        guard parent != nil else { return }
        // Notify Child View Controller
        viewController.willMove(toParent: nil)

        // Remove Child View From Superview
        viewController.view.removeFromSuperview()

        // Notify Child View Controller
        viewController.removeFromParent()
    }
    
    
}


