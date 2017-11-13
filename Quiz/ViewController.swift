//
//  ViewController.swift
//  Quiz
//
//  Created by TuyenVX on 11/9/17.
//  Copyright © 2017 TuyenVX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabelCentrerXConstraint: NSLayoutConstraint!
    @IBOutlet var answerLabel: UILabel!
    @IBAction func showNextQuestion(_sender: UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        let question: String = questions[currentQuestionIndex]
//        questionLabel.text = question
        nextQuestionLabel.text = question
        animteLabelTransitions()
    }
    @IBAction func showAnswer(_sender: UIButton){
        let anser: String = answers[currentQuestionIndex]
        answerLabel.text = anser
        
    }
    func animteLabelTransitions() {
        // animate the alpha
        let screenWidth = view.frame.width
        self.nextQuestionLabelCentrerXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
//        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear], animations: {
//            self.currentQuestionLabel.alpha = 0
//            self.nextQuestionLabel.alpha = 1
//            self.view.layoutIfNeeded()
//        }) { _ in
//            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
//            swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCentrerXConstraint)
//            self.updateOffScreenLabel()
//
//        }
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.1, options: [.curveLinear], animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
            self.view.layoutIfNeeded()
        }) { _ in
            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
            swap(&self.currentQuestionLabelCenterXConstraint, &self.nextQuestionLabelCentrerXConstraint)
            self.updateOffScreenLabel()
            
        }
    }
    let questions: [String] = [
    "What is 7+7?",
    "What is the capital of Viet Nam",
    "What is cognac made from?"
    ]
    let answers: [String] = [
    "14",
    "Ha Noi",
    "Grapes"
    ]
    var currentQuestionIndex: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
//        questionLabel.text = questions[currentQuestionIndex]
        currentQuestionLabel.text = questions[currentQuestionIndex]
        updateOffScreenLabel()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        questionLabel.alpha = 0
        nextQuestionLabel.alpha = 0
    }
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCentrerXConstraint.constant = -screenWidth
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

