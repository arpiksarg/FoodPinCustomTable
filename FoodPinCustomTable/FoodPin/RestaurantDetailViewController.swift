//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 11/13/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {

    @IBOutlet var restaurantImageView: UIImageView!
    
    @IBOutlet var restaurantNameLabel: UILabel!
    @IBOutlet var restaurantLocationLabel: UILabel!
    @IBOutlet var restaurantTypeLabel: UILabel!
    
    var restaurantImageName = ""
    var restaurantName = ""
    var restaurantLocation = ""
    var restaurantType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        restaurantImageView.image = UIImage(named: restaurantImageName)
        restaurantNameLabel.text = restaurantName
        restaurantLocationLabel.text = restaurantLocation
        restaurantTypeLabel.text = restaurantType
        
        navigationItem.largeTitleDisplayMode = .never
    }
}
