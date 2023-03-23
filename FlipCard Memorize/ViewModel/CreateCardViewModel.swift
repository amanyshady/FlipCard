//
//  CreateCardViewModel.swift
//  FlipCard Memorize
//
//  Created by Amany Shady on 21/03/2023.
//

import Foundation
import CoreData


class CreateCardViewModel {
    
    
    var resetTxtFields : Bool = false {
        
        didSet {
            
            self.resetFields?(resetTxtFields)
        }
    }
    
    var createCardItemSucces : String = "" {
        
        didSet {
            
            self.showCreateSuccAlert?(createCardItemSucces)
        }
    }
    
    var messingDataMesg : (String , String)  = ("","") {
        
        didSet {
            
            self.showEmptyTxtAlert?()
        }
    }
    
    var hasEmptyTxtField = false
    
    var showEmptyTxtAlert : (()->())?
    
    var showCreateSuccAlert : ((_ createItem : String)->())?
    var resetFields : ((_ reserResult : Bool)->())?
    
    
    func checkEmptyTxtField(quesText : String , answerTxt : String) {
        
        if !quesText.isEmpty && !answerTxt.isEmpty {
            
            hasEmptyTxtField = false
            
            //1- add card item to core data
        
            createCardItemSucces = CoreDataManager.shared.createCardItem(question: quesText, answer: answerTxt).rawValue
            
            //2- reset the question and answer fields
            if CoreDataManager.shared.createCardItem(question: quesText, answer: answerTxt) == AlertMesg.createSucces {
                
                resetTxtFields = true
            }else {
                
                resetTxtFields = false
            }
            
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
