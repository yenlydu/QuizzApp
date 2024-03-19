//
//  LoginContentView.swift
//  QuizzApp
//
//  Created by Yen-Ly DUONG on 10/03/2024.
//

import Foundation
import UIKit

final class LoginContentView: UIView {
	private lazy var contentView: UIView = {
		let view = UIView()
		view.accessibilityIdentifier = "contentView_" + className
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	private lazy var textField: UITextField = {
		let view = UITextField()
		view.accessibilityIdentifier = "textField_" + className
		view.translatesAutoresizingMaskIntoConstraints = false
		let attributes = [
			NSAttributedString.Key.foregroundColor: UIColor.lightGray,
			NSAttributedString.Key.font : UIFont.soulRegularFont(with: 18)
		]
		view.attributedPlaceholder = NSAttributedString(string: "Email", attributes: attributes as [NSAttributedString.Key : Any])
		view.layer.borderColor = UIColor.primaryColor().withAlphaComponent(0.3	).cgColor
		view.layer.borderWidth = 1
		view.layer.cornerRadius = 12
		view.leftViewMode = .always
		return view
	}()

	override func layoutSubviews() {
		super.layoutSubviews()
		setupTextFieldImageView()
	}

	func configure(textFieldDelegate: UITextFieldDelegate) {
		textField.delegate = textFieldDelegate
		contentView.layer.cornerRadius = 20
		contentView.layer.shadowColor = UIColor.lightGray.cgColor
		contentView.layer.shadowOpacity = 0.5
		contentView.layer.shadowOffset = .zero
		contentView.backgroundColor = .white
		contentView.layer.shadowRadius = 10
		setup()
	}

	func setupTextFieldImageView() {
		let imageView = UIImageView(frame: CGRect(x: 00, y: 0, width: 50, height: 40))
		imageView.image = UIImage(named: "email")
		let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
		imageContainerView.addSubview(imageView)
		imageContainerView.tintColor = .primaryColor()
		textField.leftView = imageContainerView
		textField.leftViewMode = .always
		let gesture = UITapGestureRecognizer(target: self, action: #selector(textFieldResigner))
		textField.leftView?.addGestureRecognizer(gesture)
	}

	@objc private func textFieldResigner() {
		textField.becomeFirstResponder()
	}
	
}

// MARK: - Setup Methods

private extension LoginContentView {
	func setup() {
		setupInterface()
		setupConstraints()
	}
	
	func setupInterface() {
		addSubview(contentView)
		contentView.addSubview(textField)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			// contentView
			contentView.topAnchor.constraint(equalTo: topAnchor),
			contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: bottomAnchor),

			// textField
			textField.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Margins.defaultMargin),
			textField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margins.defaultMargin),
			textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margins.defaultMargin),
			textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Margins.defaultMargin),
			textField.heightAnchor.constraint(equalToConstant: 60),
		])
	}
}
