//
//  Meal.swift
//  FoodTracker
//
//  Created by Darya Kuliashova on 12.01.21.
//

import UIKit

class Meal {
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init?(name: String, photo: UIImage?, rating: Int) {
        //name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        //rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
    }
}
