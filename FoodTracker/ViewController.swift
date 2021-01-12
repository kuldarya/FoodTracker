//
//  ViewController.swift
//  FoodTracker
//
//  Created by Darya Kuliashova on 9.12.20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var mealTextField: UITextField!
    @IBOutlet private weak var mealNameLabel: UILabel!
    @IBOutlet private weak var setDefaultLabelTextButton: UIButton!
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealTextField.delegate = self
        setupUI()
    }
    
    //MARK: - Setup
    private func setupUI() {
        mealTextField.returnKeyType = .done
        mealTextField.enablesReturnKeyAutomatically = true
        mealTextField.autocapitalizationType = .sentences
        mealNameLabel.text = "Meal Name"
        setDefaultLabelTextButton.setTitle("Set Default Text for Label", for: .normal)
    }
    
    //MARK: - Actions
    @IBAction private func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default text"
        mealTextField.text = ""
    }
}

//MARK: - Extensions
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
}

