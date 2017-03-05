//
//  TodoFetchedResultsController.swift
//  TodoList
//
//  Created by Pasan Premaratne on 6/22/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class TodoFetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>, NSFetchedResultsControllerDelegate {
    
    fileprivate let tableView: UITableView
    
    init(managedObjectContext: NSManagedObjectContext, withTableView tableView: UITableView) {
        self.tableView = tableView
        
        super.init(fetchRequest: Item.fetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        self.delegate = self
        
        tryFetch()
    }
    
    func tryFetch() {
        do {
            try performFetch()
        } catch let error as NSError {
            print("Unresolved error: \(error), \(error.userInfo)")
        }
    }
    
    // MARK: NSFetchedResultsControllerDelegate
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
}





























