//
//  CardModel.swift
//  FlipCard Memorize
//
//  Created by Amany Shady on 26/03/2023.
//

import Foundation

struct CardModel {
   
    var id: Int
    var question: String
    var answer: String
    
    init(id: Int, question: String, answer: String) {
        self.id = id
        self.question = question
        self.answer = answer
    }
    
}
