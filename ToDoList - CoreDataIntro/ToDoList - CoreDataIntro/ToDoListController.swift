//
//  ToDoListController.swift
//  ToDoList - CoreDataIntro
//
//  Created by Thomas Léger on 05/03/2017.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit
import CoreData

class ToDoListController: UITableViewController {
	
	lazy var dataSource: DataSource = {
		return DataSource(tableView: self.tableView)
	}()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		tableView.dataSource = dataSource
		
		// Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
	
	// MARK: - UITableViewDelegate
	
	override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
		return .delete
	}

	// MARK: - Navigation
	
	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
		if segue.identifier == "showItem" {
			guard let destinationController = segue.destination as? DetailViewController, let indexPath = tableView.indexPathForSelectedRow else {
				return
			}
			let item = dataSource.object(at: indexPath) as! Item
			destinationController.item = item
		}
	}
}
