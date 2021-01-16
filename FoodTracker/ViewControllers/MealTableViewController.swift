//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Darya Kuliashova on 15.01.21.
//

import UIKit
import os.log

class MealTableViewController: UITableViewController {
    private var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleMeal()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MealTableViewCell.className, for: indexPath) as? MealTableViewCell else {
            assertionFailure("The dequeued cell is not an instance of MealTableViewCell.")
            return UITableViewCell()
        }
        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
                
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? "") {
        case "AddItem":
            os_log("Adding a new meal.", log: OSLog.default, type: .debug)
        case "ShowDetail":
            guard let mealDetailsViewController = segue.destination as? MealDetailsViewController else {
                assertionFailure("Unexpected destination: \(segue.destination)")
            }
            
            guard let mealCell = sender as? MealTableViewCell else {
                assertionFailure("Unexpected sender: \(String(describing: sender))")
            }
            
            guard let indexPath = tableView.indexPath(for: mealCell) else {
                assertionFailure("The selected cell is not being displayed by the table")
            }
            let selectedMeal = meals[indexPath.row]
            mealDetailsViewController.meal = selectedMeal
        default:
            assertionFailure("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    
    //MARK: - IBActions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? MealDetailsViewController,
           let meal = sourceViewController.meal {
            //add a new meal
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    //MARK: - Private Methods
    
    private func loadSampleMeal() {
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")
        
        guard let meal1 = Meal(name: "Caprese salad", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let meal2 = Meal(name: "Checken and Potatoes", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2")
        }
        
        guard let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal3")
        }
        
        meals += [meal1, meal2, meal3]
    }
}
