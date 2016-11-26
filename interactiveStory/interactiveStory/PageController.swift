//
//  PageController.swift
//  interactiveStory
//
//  Created by Thomas Léger on 26/11/2016.
//  Copyright © 2016 Thomas Léger. All rights reserved.
//

import UIKit

class PageController: UIViewController {

	var page: Page?
	
	let artwork = UIImageView()
	let storyLabel = UILabel()
	let firstChoiceButton = UIButton(type: .system)
	let secondChoiceButton = UIButton(type: .system)
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	init(page: Page) {
		self.page = page
		super.init(nibName: nil, bundle: nil)
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

		view.backgroundColor = .white
		if let page = page {
			artwork.image = page.story.artwork
			
			
			let attributedString = attributedStringFromStr(text: page.story.text)
			storyLabel.attributedText = attributedString
			
			if let firstChoice = page.firstChoice {
				firstChoiceButton.setTitle(firstChoice.title, for: .normal)
				firstChoiceButton.addTarget(self, action: #selector(loadFirstChoice), for: .touchUpInside)
			} else {
				firstChoiceButton.setTitle("Play Again", for: .normal)
				firstChoiceButton.addTarget(self, action: #selector(PageController.playAgain), for: .touchUpInside)
			}
			if let secondChoice = page.secondChoice {
				secondChoiceButton.setTitle(secondChoice.title, for: .normal)
				secondChoiceButton.addTarget(self, action: #selector(loadSecondChoice), for: .touchUpInside)
			}
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension PageController {
	
	fileprivate func attributedStringFromStr(text: String) -> NSAttributedString {
		let attributedString = NSMutableAttributedString(string: text)
		let paragraphStyle = NSMutableParagraphStyle()
		paragraphStyle.lineSpacing = 10
		
		attributedString.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
		return attributedString
	}
	
	fileprivate func setupSubview(subview: UIView) {
		view.addSubview(subview)
		subview.translatesAutoresizingMaskIntoConstraints = false
	}
	
	override func viewWillLayoutSubviews() {
		setupSubview(subview: artwork)
		NSLayoutConstraint.activate([
			artwork.topAnchor.constraint(equalTo: view.topAnchor),
			artwork.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			artwork.rightAnchor.constraint(equalTo: view.rightAnchor),
			artwork.leftAnchor.constraint(equalTo: view.leftAnchor)])
		
		setupSubview(subview: storyLabel)
		storyLabel.numberOfLines = 0
		NSLayoutConstraint.activate([
			storyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16.0),
			storyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16.0),
			storyLabel.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -48),
			])
		
		setupSubview(subview: firstChoiceButton)
		NSLayoutConstraint.activate([
			firstChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			firstChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80.0)
			])
		
		setupSubview(subview: secondChoiceButton)
		NSLayoutConstraint.activate([
			secondChoiceButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			secondChoiceButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
			])
	}
	
	func loadFirstChoice() {
		if let page = page, let nextPage = page.firstChoice?.page {
			let pageController = PageController(page: nextPage)
			navigationController?.pushViewController(pageController, animated: true)
		}
	}
	
	func loadSecondChoice() {
		if let page = page, let nextPage = page.secondChoice?.page {
			let pageController = PageController(page: nextPage)
			navigationController?.pushViewController(pageController, animated: true)
		}
	}
	
	func playAgain() {
		navigationController?.popToRootViewController(animated: true)
	}
}
