//
//  TodoListController.swift
//  TodoList
//
//  Created by Pasan Premaratne on 6/17/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import CoreData

class TodoListController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let managedObjectContext = DataController.sharedInstance.persistentContainer.viewContext
    
    lazy var fetchedResultsController: TodoFetchedResultsController = {
        let controller = TodoFetchedResultsController(managedObjectContext: self.managedObjectContext, withTableView: self.tableView)
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let section = fetchedResultsController.sections?[section] else { return 0 }
        return section.numberOfObjects
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return configureCell(cell, atIndexPath: indexPath)
    }
    
    fileprivate func configureCell(_ cell: UITableViewCell, atIndexPath indexPath: IndexPath) -> UITableViewCell {
        let item = fetchedResultsController.object(at: indexPath) as! Item
        cell.textLabel?.text = item.text
        return cell
    }
}


























