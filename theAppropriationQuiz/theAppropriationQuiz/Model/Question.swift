//  Question.swift
//  theAppropriationQuiz


import Foundation

//create a class
class Question {
    
    //give the class properties
    let questionText: String
    let answer: Bool
    
    //give the class an init that takes two arguments and assigns them to the class properties
    init(text: String, correctAnswer: Bool) {
        questionText = text
        answer = correctAnswer
    }
    
}
