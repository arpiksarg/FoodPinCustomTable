//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 11/26/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButton: [UIButton]
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       backgroundImageView.image = UIImage(named: restaurant.image)
        
        // Applaying the blur effect
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
    }
}
