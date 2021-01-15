//
//  NSObject+Utils.swift
//  FoodTracker
//
//  Created by Darya Kuliashova on 15.01.21.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
