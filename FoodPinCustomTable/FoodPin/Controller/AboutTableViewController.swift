//
//  AboutTableTableViewController.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 12/24/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class AboutTableViewController: UITableViewController {
    
    var sectionTitles = ["Feedback", "Follow us"]
    var sectionContent = [[(image: "store", text: "Rate us on App Store", link: "https://www.apple.com/itunes/charts/paid-apps/"),
    (image: "chat", text: "Tell us your feedback", link: "http://www.appcoda.com/contact")],
    [(image: "twitter", text: "Twitter", link: "https://twitter.com/appcodamobile"),
    (image: "facebook", text: "Facebook", link: "https://facebook.com/appcodamobile"),
    (image: "instagram", text: "Instagram", link: "https://www.instagram.com/appcodadotcom")]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.cellLayoutMarginsFollowReadableWidth = true
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Configure navigation bar appearance
        
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        if let customFont = UIFont(name: "Rubik-Medium", size: 40.0) {
            navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 231, green: 76, blue: 60), NSAttributedString.Key.font: customFont]
        }
        
        // Remove the extra separator
        
        tableView.tableFooterView = UIView()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionTitles.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sectionContent[section].count
    }
    
    // Present the section Title
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section]
    }
    
    // Set the text label and return the cell
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath)

        // Configure the cell..

        let cellData = sectionContent[indexPath.section][indexPath.row]
        cell.textLabel?.text = cellData.text
        cell.imageView?.image = UIImage(named: cellData.image)

        return cell
    }
    
    // Handle Table cell selection
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Find out the link of the selected row.
        
        let link = sectionContent[indexPath.section][indexPath.row].link
        switch indexPath.section {
            
        // Leave us feedback section
        
        case 0:
            if indexPath.row == 0 {
                if let url = URL(string: link) {
                    UIApplication.shared.open(url)
                }
            } else if indexPath.row == 1 {
                performSegue(withIdentifier: "showWebView", sender: self)
            }
        default:
            break
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    // Find out the link of the selected item and pass it to the web view controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWebView" {
            if let destinationController = segue.destination as? WebViewController,
                let indexPath = tableView.indexPathForSelectedRow {
                destinationController.targetURL = sectionContent[indexPath.section][indexPath.row].link
            }
        }
    }
}
