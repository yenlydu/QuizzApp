//
//  StepButtonView.swift
//  QuizzApp
//
//  Created by Yen-Ly DUONG on 10/03/2024.
//

import Foundation
import UIKit

final class StepButtonView: UIView {
	private lazy var buttonTitleLabel: UILabel = {
		let view = UILabel()
		view.font = .soulRegularFont(with: Margins.defaultFontSize)
		view.textAlignment = .center
		view.textColor = .white
		view.accessibilityIdentifier = "buttonTitleLabel_" + className
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()

	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = frame.size.height / 2
	}
	func configure(title: String, color: UIColor = .primaryColor()) {
		buttonTitleLabel.text = title
		backgroundColor = color
		layer.borderColor = color.cgColor
		layer.borderWidth = 1
		setup()
	}

	@objc private func tapButton() {
		let feedbackGenerator = UIImpactFeedbackGenerator()

		// Trigger Haptic Feedback
		feedbackGenerator.impactOccurred()
		UIView .animate(withDuration: 0.1, animations: { [weak self] in
			guard let s = self else {
				return
			}
			s.alpha = 1
		}, completion: { [weak self] completed  in
			if completed {
				guard let s = self else {
					return
				}
			}
		})

	}
}

// MARK: - Setup Methods

private extension StepButtonView {
	func setup() {
		setupInterface()
		setupConstraints()
		let gesture = UITapGestureRecognizer(target: self, action: #selector(tapButton))
		addGestureRecognizer(gesture)

	}
	
	func setupInterface() {
		addSubview(buttonTitleLabel)
	}
	
	func setupConstraints() {
		NSLayoutConstraint.activate([
			// buttonTitleLabel
			buttonTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: Margins.defaultMargin),
			buttonTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Margins.defaultMargin),
			buttonTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Margins.defaultMargin),
			buttonTitleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Margins.defaultMargin),
		])
	}
}
