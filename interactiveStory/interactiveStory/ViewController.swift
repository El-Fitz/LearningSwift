//
//  ViewController.swift
//  interactiveStory
//
//  Created by Thomas Léger on 19/11/2016.
//  Copyright © 2016 Thomas Léger. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
	
	enum error: Error {
		case NoName
	}
	
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var textFieldLayoutConstraint: NSLayoutConstraint!
	var keyboardHeight: CGFloat!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "startAdventure" {
			do {
				if let name = nameTextField.text {
					if name == "" {
						throw error.NoName
					}
					if let pageController = segue.destination as? PageController {
						pageController.page = Adventure.story(name: "ElFitz")
					}
				}
			} catch error.NoName {
				debugPrint("No name")
				let alertController = UIAlertController(title: "Name Not Provided", message: "Provide a name to start you story !", preferredStyle: .alert)
				let action = UIAlertAction(title: "OK", style: .default, handler: nil)
				alertController.addAction(action)
				self.present(alertController, animated: true, completion: nil)
			} catch let randomError {
				fatalError(randomError as! String)
			}
		}
	}
	
	func keyboardWillShow(notification: NSNotification) {
		if let userInfoDict = notification.userInfo, let keyboardFrameVal = userInfoDict[UIKeyboardFrameEndUserInfoKey] as? NSValue {
			let keyboardFrame = keyboardFrameVal.cgRectValue
			keyboardHeight = keyboardFrame.size.height
			UIView.animate(withDuration: 0.8, animations: {
				self.textFieldLayoutConstraint.constant += keyboardFrame.size.height
				self.view.layoutIfNeeded()
			})
		}
	}
	
	func keyboardWillHide(notification: NSNotification) {
		UIView.animate(withDuration: 0.8, animations: {
			self.textFieldLayoutConstraint.constant -= self.keyboardHeight
			self.view.layoutIfNeeded()
		})
	}
}

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
