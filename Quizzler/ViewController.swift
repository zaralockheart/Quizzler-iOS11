//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit
import ProgressHUD

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    var currentQuestion: Int = 0
    var score: Int = 0
    let allQuestions = QuestionBank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = allQuestions.list[currentQuestion].questionText
        self.startOver()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer(answer: (sender.tag == 1))
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(currentQuestion + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(currentQuestion + 1)
        invalidateQuestion()
    }
    
    
    func nextQuestion() {
        currentQuestion += 1
        setQuestion()
    }
    
    
    func checkAnswer(answer: Bool) {
        if answer == allQuestions.list[currentQuestion].answer {
            score += 1
            ProgressHUD.showSuccess("You got it!")
        } else {
            ProgressHUD.showError("Wrong!")
        }
        
        updateUI()
    }
    
    
    func startOver() {
        
        currentQuestion = 0
        score = 0
        updateUI()
        setQuestion()
    }
    
    func text() -> String {
        return allQuestions.list[currentQuestion].questionText
    }
    
    func setQuestion() {
        questionLabel.text = text()
    }
    
    func invalidateQuestion(){
        if currentQuestion >= allQuestions.list.count - 1 {
            self.showDialogCompletion()
            
        } else {
            self.nextQuestion()
        }
    }
    
    func showDialogCompletion() {
        let alert = UIAlertController(title: "Awesome", message: "You've finished all the questions, do you want to start over?", preferredStyle: .alert)
        
        let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
            self.startOver()
        }
        
        alert.addAction(restartAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
}
