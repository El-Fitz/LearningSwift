//
//  CoreDataStack.swift
//  ToDoList - CoreDataIntro
//
//  Created by Thomas Léger on 05/03/2017.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import CoreData

public class DataController: NSObject {
	
	static let sharedInstance = DataController()
	
	private override init() {}
	
	private lazy var applicationDocumentsDirectory: NSURL = {
		let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return urls[urls.index(before: urls.endIndex)] as NSURL
	}()
	
	private lazy var managedObjectModel: NSManagedObjectModel = {
		let modelURL = Bundle.main.url(forResource: "ToDoList - CoreDataIntro", withExtension: "momd")!
		return NSManagedObjectModel(contentsOf: modelURL)!
	}()
	
	private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
		let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
		let url = self.applicationDocumentsDirectory.appendingPathComponent("ToDoList - CoreDataIntro.sqlite")
		
		do {
			try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
		} catch let error {
			let userInfo: [String : AnyObject] = [
				NSLocalizedDescriptionKey: "Failed to init the application's saved data" as AnyObject,
				NSLocalizedFailureReasonErrorKey: "There was an error creating or loading the app's saved data" as AnyObject,
				NSUnderlyingErrorKey: error as NSError
			]
			let wrappedError = NSError(domain: "com.none.CoreDataError", code: 9999, userInfo: userInfo)
			print("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
		}
		return coordinator
	}()
	
	public lazy var manageObjectContext: NSManagedObjectContext = {
		let coordinator = self.persistentStoreCoordinator
		let managedObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
		
		managedObjectContext.persistentStoreCoordinator = coordinator
		return managedObjectContext
	}()
	
	public func saveContext() {
		if manageObjectContext.hasChanges {
			do {
				try manageObjectContext.save()
			} catch let error as NSError {
				print("We don't manage errors ! Yay !\n\(error), \(error.userInfo)")
			}
		}
	}
}
