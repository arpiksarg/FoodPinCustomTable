//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Simon Ng on 8/8/2018.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurants:[Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha", isVisited: false),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier", isVisited: false),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isVisited: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso", isVisited: false),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif", isVisited: false),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats", isVisited: false),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf", isVisited: false),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional", isVisited: false),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina", isVisited: false),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia", isVisited: false),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak", isVisited: false),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen", isVisited: false)
    ]
    
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
        return restaurants.count
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
