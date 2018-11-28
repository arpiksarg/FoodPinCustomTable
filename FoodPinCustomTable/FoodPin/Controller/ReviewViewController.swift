//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 11/26/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {

    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       backgroundImageView.image = UIImage(named: restaurant.image)
        
        // Exercise #1 Adding slide-in-from-top animation to close button
        
        let slideInFromTop = CGAffineTransform.init(translationX: 0, y: -100)
        closeButton.transform = slideInFromTop
        closeButton.alpha = 0
        
        // Applaying the blur effect
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        
        // Combined Animations
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        let scaleUpTransform = CGAffineTransform.init(scaleX: 5.0, y: 5.0)
        let moveScaletransform = scaleUpTransform.concatenating(moveRightTransform)
        
        // Make the button invisible and move off the screen
        
        for rateButton  in rateButtons {
            rateButton.transform = moveScaletransform
            rateButton.alpha = 0
        }
    }

override func viewWillAppear(_ animated: Bool) {
    
    // Exercise #1
    
    UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations: { self.closeButton.alpha = 1.0
        self.closeButton.transform = .identity
    }, completion: nil)
    
    // Set Spring animation to the rateButtons
    // Exercise #2 rewritten code with for-in loop
    
    for rateButton in rateButtons {
        UIView.animate(withDuration: 0.8, delay: 0.1, usingSpringWithDamping: 0.2, initialSpringVelocity: 0.3, options: [], animations: {
            rateButton.alpha = 1.0
            rateButton.transform = .identity }, completion: nil)
        
        }
   }
}
