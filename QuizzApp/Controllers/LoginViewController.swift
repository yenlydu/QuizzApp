//
//  LoginViewController.swift
//  QuizzApp
//
//  Created by Yen-Ly DUONG on 10/03/2024.
//

import Foundation
import UIKit

final class LoginViewController: QAViewController {
	private lazy var stepButtonView: StepButtonView = {
		let view = StepButtonView()
		view.accessibilityIdentifier = "stepButtonView_" + className
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private lazy var loginContentView: LoginContentView = {
		let view = LoginContentView()
		view.accessibilityIdentifier = "loginContentView_" + className
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		stepButtonView.configure(title: "Suivant")
		loginContentView.configure(textFieldDelegate: self)
		setup()
		hideKeyboardWhenTappedAround()
	}
}

extension LoginViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		textField.resignFirstResponder()
	}
}

// MARK: - Setup Methods

private extension LoginViewController {
	func setup() {
		setupInterface()
		setupConstraints()
	}
	
	func setupInterface() {
		view.addSubview(loginContentView)
		view.addSubview(stepButtonView)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			// loginContentView
			loginContentView.topAnchor.constraint(greaterThanOrEqualTo: view.topAnchor, constant: Margins.defaultMargin),
			loginContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margins.defaultMargin),
			loginContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margins.defaultMargin),
			loginContentView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			loginContentView.centerYAnchor.constraint(equalTo: view.centerYAnchor),


			// stepButtonView
			stepButtonView.topAnchor.constraint(greaterThanOrEqualTo: loginContentView.bottomAnchor, constant: Margins.defaultMargin),
			stepButtonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margins.defaultMargin),
			stepButtonView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margins.defaultMargin),
			stepButtonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -Margins.defaultMargin),
		])
	}
}
