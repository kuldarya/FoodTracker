//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Darya Kuliashova on 12.01.21.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {

    //Meal Class Tests
    
    func testMealInitializationSucceeds() {
        //zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        //highest positive rating
        let highestRatingMeal = Meal.init(name: "Highest", photo: nil, rating: 5)
        XCTAssertNotNil(highestRatingMeal)
    }
    
    func testMealInitializationFails() {
        //negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        //rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
        //empty name
        let emptyMealName = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyMealName)
        
    }
    

}
