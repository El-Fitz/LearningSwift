//
//  Item+CoreDataClass.swift
//  ToDoList - CoreDataIntro
//
//  Created by Thomas Léger on 05/03/2017.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
class Item: NSManagedObject {
	static let identifier: String = "Item"
	
	override class func fetchRequest() -> NSFetchRequest<NSFetchRequestResult> {
		let request = NSFetchRequest<NSFetchRequestResult>(entityName: Item.identifier)
		let sortDescriptor = NSSortDescriptor(key: "text", ascending: true)
		
		request.sortDescriptors = [sortDescriptor]
		
		return request
	}
}
