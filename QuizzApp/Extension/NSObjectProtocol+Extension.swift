//
//  NSObjectProtocol+Extension.swift
//  QuizzApp
//
//  Created by Yen-Ly DUONG on 10/03/2024.
//

import Foundation

extension NSObjectProtocol {
	/// Returns name of a current object's class
	var className: String {
		return String(describing: Self.self)
	}
}
