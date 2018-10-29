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
    let allQuestions : QuestionBank = QuestionBank()
    var currentQuestion : Int = 0
    var correctAnswers : Int = 0
    var score : Float = 0,
        multiplier : Float = 1
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressLabel.text = "\(currentQuestion+1)/\(allQuestions.list.count)"
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        let pickedAnswer : Bool = sender.tag == 1 ? true : false
        checkAnswer(pickedAnswer)
    }
    
    
    func updateUI() {
        nextQuestion()
    }
    

    func nextQuestion() {
        let question = allQuestions.list[currentQuestion]
        questionLabel.text = question.questionText
        progressLabel.text = "\(currentQuestion+1)/\(allQuestions.list.count)"
        scoreLabel.text = "Score: \(score)"
        progressBar.frame.size.width = (UIScreen.main.bounds.width) / (CGFloat(allQuestions.list.count)) * CGFloat(currentQuestion+1)
    }
    
    
    func checkAnswer(_ pickedAnswer : Bool) {
        if allQuestions.list[currentQuestion].answer == pickedAnswer {
            print("Correct")
            multiplier = multiplier >= 4.0 ? 4.0 : multiplier + 0.5
            score += 100.0 * multiplier
            ProgressHUD.showSuccess("Correct!")
        }
        else {
            ProgressHUD.showError("Wrong!")
            multiplier = 1
        }
        currentQuestion += 1
        if currentQuestion >= allQuestions.list.count {
            let alert = UIAlertController(title: "Awesome!!", message: "You finished all the questions. Do u wanna start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        else {
            self.nextQuestion()
        }
    }
    
    
    func startOver() {
        currentQuestion = 0
        score = 0
        multiplier = 1
        nextQuestion()
    }
    

    
}
