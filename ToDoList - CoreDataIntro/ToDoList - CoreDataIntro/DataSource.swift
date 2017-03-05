//
//  DataSource.swift
//  ToDoList - CoreDataIntro
//
//  Created by Thomas Léger on 05/03/2017.
//  Copyright © 2017 None. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DataSource: NSObject, UITableViewDataSource {
	
	private let tableView: UITableView
	
	let managedObjectContext = DataController.sharedInstance.manageObjectContext
	
	lazy var fetchedResultsController: TodoFetchedResultsController = {
		let controller = TodoFetchedResultsController(managedObjectContext: self.managedObjectContext, withTableView: self.tableView)
		return controller
	}()
	
	init(tableView: UITableView) {
		self.tableView = tableView
	}
	
	func object(at indexPath: IndexPath) -> NSManagedObject {
		return fetchedResultsController.object(at: indexPath) as! NSManagedObject
	}
	
	// MARK: - Table view data source
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return fetchedResultsController.sections?.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let section = fetchedResultsController.sections?[section] else { return 0 }
		return section.numberOfObjects
	}
	
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		
		// Configure the cell...
		//cell.textLabel?.text = items[indexPath.row].text
		return configureCell(cell: cell, atIndexPath: indexPath)
	}
	
	private func configureCell(cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
		let item = fetchedResultsController.object(at: indexPath) as! Item
		cell.textLabel?.text = item.text
		return cell
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		let item = fetchedResultsController.object(at: indexPath) as! NSManagedObject
		managedObjectContext.delete(item)
		DataController.sharedInstance.saveContext()
	}
}
