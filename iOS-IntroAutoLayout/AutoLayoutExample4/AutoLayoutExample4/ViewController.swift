//
//  ViewController.swift
//  AutoLayoutExample4
//
//  Created by Pasan Premaratne on 4/16/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


	@IBOutlet weak var labelCenterYConstraint: NSLayoutConstraint!
	
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	override func viewWillLayoutSubviews() {
		labelCenterYConstraint.constant = 100.0
	}
}

