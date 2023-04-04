//
//  MemorizeViewModel.swift
//  FlipCard Memorize
//
//  Created by Amany Shady on 26/03/2023.
//

import Foundation

class MemorizeViewModel {
    
   
    var isOpen = false
    
    var loadingState : Bool = true {
        
        didSet {
           
            self.loadingIndicator?()
        }
    }
    
    var cardList : [CardModel] = [CardModel]() {
        
        didSet {
            
            updateCards?()
        }
    }
    
    var updateCards : (()->())?
    var loadingIndicator : (()->())?
    
    
    var numberOfCards : Int {
        
        return cardList.count
    }
    

    func getAllCardItems() {
        
        CoreDataManager.shared.getAllCardItems(completion: { [weak self] cardList in

            var list = cardList.map{

                self!.initCardModel(cardItem: $0)

            }

            self?.cardList = list

            self?.loadingState = false
        })
        
       
        
    }
    
    func initCardModel(cardItem : CardItem) -> CardModel {
        
        return CardModel(id: Int(cardItem.id), question: cardItem.question, answer: cardItem.answer)
    }
    
}
