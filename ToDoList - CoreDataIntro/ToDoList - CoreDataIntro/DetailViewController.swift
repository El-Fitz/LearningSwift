//
//  DetailViewController.swift
//  ToDoList - CoreDataIntro
//
//  Created by Thomas Léger on 05/03/2017.
//  Copyright © 2017 None. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

	@IBOutlet weak var textField: UITextField!
	var item: Item?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		guard let item = item else {
			fatalError("Cannot show item detail if no item. Duh")
		}
		textField.text = item.text
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

	@IBAction func save(_ sender: Any) {
		if let item = item {
			item.text = textField.text
			DataController.sharedInstance.saveContext()
			
			self.navigationController?.popViewController(animated: true)
		}
	}
}
