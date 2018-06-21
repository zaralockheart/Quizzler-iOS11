//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    var currentQuestion: Int = 0
    let allQuestions = QuestionBank()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questionLabel.text = allQuestions.list[currentQuestion].questionText
        startOver()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer(answer: (sender.tag == 1))
    }
    
    
    func updateUI() {
        
        progressLabel.text = "\(String(currentQuestion + 1))/13"
        
        invalidateQuestion()
    }
    

    func nextQuestion() {
        currentQuestion += 1
        setQuestion()
    }
    
    
    func checkAnswer(answer: Bool) {
        if answer == allQuestions.list[currentQuestion].answer {
            updateUI()
        }
    }
    
    
    func startOver() {
        currentQuestion = 0
        progressLabel.text = "\(String(currentQuestion))/13"
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
            startOver()
        } else {
            nextQuestion()
        }
    }
    

    
}
