//
//  ViewController.swift
//  FoodTracker
//
//  Created by Darya Kuliashova on 9.12.20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private weak var mealTextField: UITextField!
    @IBOutlet private weak var mealName: UILabel!
    @IBOutlet weak var setDefaultTextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealName.text = "Meal Name"
        setDefaultTextButton.setTitle("Set Default Text for Label", for: .normal)
        
        setupMealTextField()
    }
    
    //MARK: - Setup
    private func setupMealTextField() {
        mealTextField.delegate = self
        mealTextField.returnKeyType = .done
        mealTextField.enablesReturnKeyAutomatically = true
    }
    
    @IBAction func SetDefaultTextButtonTapped(_ sender: Any) {
    }
}

