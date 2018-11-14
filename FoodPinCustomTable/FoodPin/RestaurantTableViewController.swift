//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 8/8/2018.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend", "homei", "teakha", "cafeloisl", "petiteoyster", "forkeerestaurant", "posatelier", "bourkestreetbakery", "haighschocolate", "palominoespresso", "upstate", "traif", "grahamavenuemeats", "wafflewolf", "fiveleaves", "cafelore", "confessional", "barrafina", "donostia", "royaloak", "caskpubkitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
            
            // Delete the row from the data source
            
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            // Call completion handler to dismiss the action button
            
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red: 231.0/255, green: 76.0/255, blue: 60.0/255, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            let activityController: UIActivityViewController
            
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
                
                activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
            
            } else {
             
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
           
            }
            
            //= UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath)
                {
                    popoverController.sourceRect = cell.bounds
                    popoverController.sourceView = cell
                }
            }

            self.present(activityController, animated: true, completion: nil)
            
            completionHandler(true)
    
        }
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction, shareAction])
        
        
        return swipeConfiguration
    }
    
    //Exercise #1
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let selectRowAction = UIContextualAction(style: .normal, title: "select") {
            (action, sourceView, completionHandler) in
            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
           
            cell.heartImage.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
            
            completionHandler(true)
            
        }
        
        let checkIcon = restaurantIsVisited[indexPath.row] ? "undo" : "tick"
        
        selectRowAction.backgroundColor = UIColor(red: 48.0/255.0, green: 150.0/255.0, blue: 50.0/255.0, alpha: 1.0)
        selectRowAction.image = UIImage(named: checkIcon)
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [selectRowAction])
        
        return swipeConfiguration
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        // Configure the cell...
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        // checking if restaurant is visited.
        // If it is also change accessoryType property to prevent the bug
    
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark : .none
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurantImageName = restaurantImages[indexPath.row]
                destinationController.restaurantName = restaurantNames[indexPath.row]
                destinationController.restaurantType = restaurantTypes[indexPath.row]
                destinationController.restaurantLocation = restaurantLocations[indexPath.row]
            }
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let optionMenu = UIAlertController(title: nil,
//                                           message: "What do you want to do?",
//                                           preferredStyle: .actionSheet)
//        let cancelAction = UIAlertAction(title: "Cancel",
//                                         style: .cancel,
//                                         handler: nil )
//        optionMenu.addAction(cancelAction)
//
//        //present(optionMenu, animated: true, completion: nil)
//
//        if let popoverController = optionMenu.popoverPresentationController {
//            if let cell = tableView.cellForRow(at: indexPath)
//            {
//                popoverController.sourceView = cell
//                popoverController.sourceRect = cell.bounds
//            }
//        }
//
//        let callActionHandler = {
//            (action: UIAlertAction!) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable",
//                                                 message: "Sorry the call feature is not available yet.",
//                                                 preferredStyle: .alert)
//            alertMessage.addAction(UIAlertAction(title: "Ok",
//                                                 style: .default,
//                                                 handler: nil))
//
//            self.present(alertMessage, animated: true, completion: nil)
//        }
//
//        let callAction = UIAlertAction(title: "Call" + "123-000-\(indexPath.row + 1)",
//                                       style: .default,
//                                       handler: callActionHandler)
//
//        optionMenu.addAction(callAction)
//
//        let checkActionTitle = (restaurantIsVisited[indexPath.row]) ? "Undo Check in" : "Check in"
//
//        // Check in action
//
//        let checkInActionHandler = { (action:UIAlertAction!) -> Void in
//
//            let cell = tableView.cellForRow(at: indexPath) as! RestaurantTableViewCell
//            self.restaurantIsVisited[indexPath.row] = !self.restaurantIsVisited[indexPath.row]
////
////            cell.accessoryType = (self.restaurantIsVisited[indexPath.row]) ? .checkmark : .none
//
//            cell.heartImage.isHidden = self.restaurantIsVisited[indexPath.row] ? false : true
//
//        }
//
//        let checkInAction = UIAlertAction(title: checkActionTitle,
//                                          style: .default,
//                                          handler: checkInActionHandler)
//
//        optionMenu.addAction(checkInAction)
//
//        // Display the menu
//
//        present(optionMenu, animated: true, completion: nil)
//
//        // Deselect the row
//
//        tableView.deselectRow(at: indexPath, animated: false)
//    }
}
