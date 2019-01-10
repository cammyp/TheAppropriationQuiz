//  QuestionBank.swift
//  theAppropriationQuiz


import Foundation

//create class
class QuestionBank {
    
    //create class property
    //an array of questions
    var list = [Question]()
    
    //when we use QuestionBank also init
    init() {
        
        //5 question classes
        list.append(Question(text: "Do you use the word 'sis'?", correctAnswer: true))
        list.append(Question(text: "Do you lay your baby hairs?", correctAnswer: true))
        list.append(Question(text: "Do you own a dashiki?", correctAnswer: true))
        list.append(Question(text: "Do you overline your lips, or have lip fillers?", correctAnswer: true))
        list.append(Question(text: "Do you tan your skin more than twice a year?", correctAnswer: true))
        
    }
    
}
