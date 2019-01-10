//  ViewController.swift
//  theAppropriationQuiz

import UIKit

class ViewController: UIViewController {
    
    //declare properties here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = 0
    var score : Int = 0
    
    //create connections here
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var progressBar: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nextQuestion()
    }
    
    @IBAction func answerPressed(_ sender: UIButton) {
        
        //get the users answer
        if(sender.tag == 1) {
            pickedAnswer = true
        } else if(sender.tag == 2) {
            pickedAnswer = false
        }
        
        //check the users answer
        checkAnswer()
        //increment the question number
        questionNumber = questionNumber + 1
        //go to the next question
        nextQuestion()
     
    }
    
    func checkAnswer() {
        
        //get correctAnswer and compare it against the users answer
        let correctAnswer = allQuestions.list[questionNumber].answer
        if(correctAnswer == pickedAnswer) {
            //display something here
            score = score + 20
        } else {
            //display something else here
        }
    }
    
    func nextQuestion() {
        
        //if we still have questions
        if(questionNumber <= 4) {
            //set the questionLabel text
            questionLabel.text = allQuestions.list[questionNumber].questionText
            updateUI()
        } else {
            //if we dont have questions alert the user the quiz is over
            lastUpdateUI()
            //svprogresshud.loading
            //analyzing results
            
            //if score is >= 30...
            if(score >= 30) {
                showBadResults()
            } else {
                showGoodResults()
            }
        }
    }
    
    func updateUI() {
        //update score, progressLabel, and progressBar
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNumber + 1)/\(allQuestions.list.count)"
        let width = view.frame.size.width
        progressBar.frame.size.width = CGFloat((Int(width) / allQuestions.list.count)) * CGFloat(questionNumber + 1)
    }
    
    func lastUpdateUI() {
        //update score and progressBar
        scoreLabel.text = "Score: \(score)"
        let width = view.frame.size.width
        progressBar.frame.size.width = CGFloat((Int(width) / allQuestions.list.count)) * CGFloat(questionNumber + 1)
    }
    
    func startOver() {
        //reset all incrementing vars
        questionNumber = 0
        score = 0
        //call next question
        nextQuestion()
    }
    
    func showBadResults() {
        //display alert with unique message for score of 60 or more
        let alert = UIAlertController(title: "\(score) %", message: "You \(score) % appropriate Black culture. We reccomend looking into Black history, since you want to look and act like you are Black.", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            self.startOver()
        })
        
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    }
    
    func showGoodResults() {
        //display alert with unique message for score of 40 or less
        let alert = UIAlertController(title: "\(score) %", message: "You \(score) % appropriate Black culture. Congratulations on being a unique individual! Share this quiz with your friends to see if they are as unique as you.", preferredStyle: .alert)
        let restartAction = UIAlertAction(title: "Ok", style: .default, handler: { (UIAlertAction) in
            self.startOver()
        })
        
        alert.addAction(restartAction)
        present(alert, animated: true, completion: nil)
    }

}

