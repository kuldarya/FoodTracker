//
//  ViewController.swift
//  FoodTracker
//
//  Created by Darya Kuliashova on 9.12.20.
//

import UIKit

class FoodTrackerViewController: UIViewController {
    @IBOutlet private weak var mealTextField: UITextField!
    @IBOutlet private weak var mealNameLabel: UILabel!
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var ratingControl: RatingControl!
    
    private lazy var imagePickerController = UIImagePickerController()
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mealTextField.delegate = self
        imagePickerController.delegate = self
        
        setupUI()
    }
    
    //MARK: - Setup
    private func setupUI() {
        mealTextField.returnKeyType = .done
        mealTextField.enablesReturnKeyAutomatically = true
        mealTextField.autocapitalizationType = .sentences
        
        mealNameLabel.text = "Meal Name"
                
        photoImageView.image = UIImage(named: "defaultPhoto")
    }
    
    //MARK: - Actions
    @IBAction private func setDefaultLabelText(_ sender: UIButton) {
        mealNameLabel.text = "Default text"
        mealTextField.text = ""
    }
}

//MARK: - Extensions
extension FoodTrackerViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mealNameLabel.text = textField.text
    }
}

extension FoodTrackerViewController: UIImagePickerControllerDelegate {
    @IBAction private func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Make sure keyboard is closed any time the imageView is tapped
        mealTextField.resignFirstResponder()
        
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoImageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
}

extension FoodTrackerViewController: UINavigationControllerDelegate {
}

