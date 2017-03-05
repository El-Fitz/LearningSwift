//
//  ViewController.swift
//  AutoLayoutExample5
//
//  Created by Pasan Premaratne on 4/17/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let orangeView = UIView()
    let purpleView = UIView()
    let blueView = UIView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
		orangeView.backgroundColor = .orange
        view.addSubview(orangeView)
        
		purpleView.backgroundColor = .purple
        view.addSubview(purpleView)
        
		blueView.backgroundColor = .blue
        view.addSubview(blueView)
    }
    
    override func viewWillLayoutSubviews() {
        setupOrangeViewConstraints()
        setupPurpleViewConstraints()
        setupBlueViewConstraints()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupOrangeViewConstraints() {
        orangeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            orangeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            orangeView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: -10.0),
            orangeView.heightAnchor.constraint(equalToConstant: 57.0),
            orangeView.widthAnchor.constraint(equalToConstant: 200.0)
        ])
    }
    
    func setupPurpleViewConstraints() {
        purpleView.translatesAutoresizingMaskIntoConstraints = false
		
		
		NSLayoutConstraint.activate([
			purpleView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
			purpleView.bottomAnchor.constraint(equalTo: orangeView.topAnchor, constant: -8.0),
			purpleView.trailingAnchor.constraint(equalTo: blueView.leadingAnchor, constant: -8.0),
			purpleView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8.0)
			])
    }
    
    func setupBlueViewConstraints() {
        blueView.translatesAutoresizingMaskIntoConstraints = false
		
		
		NSLayoutConstraint.activate([
			blueView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8.0),
			blueView.bottomAnchor.constraint(equalTo: orangeView.topAnchor, constant: -8.0),
			blueView.leadingAnchor.constraint(equalTo: purpleView.trailingAnchor, constant: 8.0),
			blueView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8.0),
			blueView.widthAnchor.constraint(equalTo: purpleView.widthAnchor)
			])
    }
}































