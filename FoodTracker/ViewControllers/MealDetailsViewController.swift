//
//  ViewController.swift
//  FoodTracker
//
//  Created by Darya Kuliashova on 9.12.20.
//

import UIKit
import os.log

class MealDetailsViewController: UIViewController {
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var photoImageView: UIImageView!
    @IBOutlet private weak var ratingControl: RatingControl!
    @IBOutlet private weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    private lazy var imagePickerController = UIImagePickerController()
    
    //MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        imagePickerController.delegate = self
        
        setupUI()
        updateSaveButtonState()
    }
    
    //MARK: - Setup
    private func setupUI() {
        nameTextField.returnKeyType = .done
        nameTextField.enablesReturnKeyAutomatically = true
        nameTextField.autocapitalizationType = .sentences
                        
        photoImageView.image = UIImage(named: "defaultPhoto")
    }
    
    //MARK: - Navigation
    
    //configure a view controller before it's presented
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        let name = nameTextField.text ?? ""
        let image = photoImageView.image
        let rating = ratingControl.rating
        
        meal = Meal(name: name, photo: image, rating: rating)
    }
    
    //MARK: - IBActions
    @IBAction func cancelNewMeal(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Private Methods
    private func updateSaveButtonState() {
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
}

//MARK: - Extensions
extension MealDetailsViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }
}

extension MealDetailsViewController: UIImagePickerControllerDelegate {
    @IBAction private func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Make sure keyboard is closed any time the imageView is tapped
        nameTextField.resignFirstResponder()
        
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

extension MealDetailsViewController: UINavigationControllerDelegate {
}

