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
    
    var restaurant = Restaurant()
   
    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationItem.largeTitleDisplayMode = .never
    }
}
