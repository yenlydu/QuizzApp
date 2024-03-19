//
//  QAViewController.swift
//  QuizzApp
//
//  Created by Yen-Ly DUONG on 10/03/2024.
//

import Foundation
import UIKit

class QAViewController: UIViewController {
	func hideKeyboardWhenTappedAround() {
		let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
}
