//
//  CoreDataManager.swift
//  FlipCard Memorize
//
//  Created by Amany Shady on 22/03/2023.
//

import Foundation
import CoreData


enum AlertMesg : String {
    
    case createSucces = "You successfully create your card"
    case createFaild = "Can't create your card"
}

class CoreDataManager {
    
    // singelton
   static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer
    
    var viewContext : NSManagedObjectContext {
        
        return persistentContainer.viewContext
    }
    
    
    private init() {
        
        // pass the data model filename to NSPersistentContainer initializer
        persistentContainer = NSPersistentContainer(name: "FlipCard_Memorize")
        
        // load any persistent stores
        persistentContainer.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
        
    }
    
    // save the changes on your context to the persistent store
    func saveContext() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    
    
    func createCardItem (question : String , answer : String) -> AlertMesg {
        
      
        let cardItem = CardItem(context: viewContext)
        
        cardItem.question = question
        cardItem.answer = answer
        cardItem.id = Int32(Int.random(in: 0...6))
        
        do {
            try viewContext.save()
            return AlertMesg.createSucces
            
            } catch let error {
              
                print("create error",error)
                return AlertMesg.createFaild
            }
        
        
    }
    
    
    func getAllCardItems(completion : @escaping (_ cardList : [CardItem]) -> ())  {
        
        let request = CardItem.fetchRequest()
        
        do {
            completion( try viewContext.fetch(request))
            } catch {
               completion([])
            }
        
    }
    
}
