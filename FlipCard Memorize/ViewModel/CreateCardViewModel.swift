//
//  CreateCardViewModel.swift
//  FlipCard Memorize
//
//  Created by Amany Shady on 21/03/2023.
//

import Foundation


class CreateCardViewModel {
   
    
    var messingDataMesg : (String , String)  = ("","") {
        
        didSet {
           
            self.showEmptyTxtAlert?()
        }
    }
    
    var hasEmptyTxtField = false
  
    var showEmptyTxtAlert : (()->())?
    
    
    func checkEmptyTxtField(quesText : String , answerTxt : String) {
     
        if !quesText.isEmpty && !answerTxt.isEmpty {
            
            hasEmptyTxtField = false
        }else {
            
            hasEmptyTxtField = true
            
            if quesText.isEmpty {
                
                messingDataMesg.0 = "You have to set your question"
            }else {
               
                messingDataMesg.0 = ""
            }
            
            if answerTxt.isEmpty {
                messingDataMesg.1 = "You have to set your answer"
            }else {
               
                messingDataMesg.1 = ""
            }
        }
        
        
    }
    
    
}
