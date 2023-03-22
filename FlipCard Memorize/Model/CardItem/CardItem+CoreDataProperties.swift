//
//  CardItem+CoreDataProperties.swift
//  FlipCard Memorize
//
//  Created by Amany Shady on 22/03/2023.
//
//

import Foundation
import CoreData


extension CardItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CardItem> {
        return NSFetchRequest<CardItem>(entityName: "CardItem")
    }

    @NSManaged public var id: Int32
    @NSManaged public var question: String
    @NSManaged public var answer: String

}

extension CardItem : Identifiable {

}
