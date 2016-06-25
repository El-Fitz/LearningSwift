//
//  ViewController.swift
//  SwiftFirstApp
//
//  Created by Thomas LEGER on 4/10/16.
//  Copyright © 2016 Thomas LEGER. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var funFactLabel: UILabel!
    @IBOutlet weak var funFactButton: UIButton!
    let factModel = FactModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        funFactLabel.text = factModel.getRandomFact()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func newFunFact() {
        view.backgroundColor = ColorModel().getRandomColor()
        funFactButton.tintColor = view.backgroundColor
        funFactLabel.text = factModel.getRandomFact()
        
    }

}

