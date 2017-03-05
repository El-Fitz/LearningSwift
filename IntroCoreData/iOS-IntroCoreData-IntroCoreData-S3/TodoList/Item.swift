//
//  Item.swift
//  TodoList
//
//  Created by Pasan Premaratne on 6/18/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import CoreData


class Item: NSManagedObject {
    
    static let identifier = "Item"
    
    override class func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Item.identifier)
        let sortDescriptor = NSSortDescriptor(key: "text", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }

}
