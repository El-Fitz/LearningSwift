//
//  ViewController.swift
//  TodoList
//
//  Created by Pasan Premaratne on 6/15/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    let dataController = DataController.sharedInstance
    lazy var managedObjectContext: NSManagedObjectContext? = {
        return self.dataController.persistentContainer.viewContext
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancel(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: AnyObject) {
        
        guard let text = textField.text,
            let managedObjectContext = self.managedObjectContext
            else { return }
        
        let item = NSEntityDescription.insertNewObject(forEntityName: Item.identifier, into: managedObjectContext) as! Item
        
        item.text = text
        
        dataController.saveContext()
        
        dismiss(animated: true, completion: nil)
    }

}

























