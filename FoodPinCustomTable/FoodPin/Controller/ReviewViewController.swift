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
    @IBOutlet var rateButtons: [UIButton]!
    
    var restaurant = Restaurant()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       backgroundImageView.image = UIImage(named: restaurant.image)
        
        // Applaying the blur effect
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        for rateButton in rateButtons {
            rateButton.alpha = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 2.0) {
//            self.rateButtons[0].alpha = 1.0
//            self.rateButtons[1].alpha = 1.0
//            self.rateButtons[2].alpha = 1.0
//            self.rateButtons[3].alpha = 1.0
//            self.rateButtons[4].alpha = 1.0
        
            UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {self.rateButtons[0].alpha = 1.0}, completion: nil)
            UIView.animate(withDuration: 0.4, delay: 0.15, options: [], animations: {self.rateButtons[1].alpha = 1.0}, completion: nil)
            UIView.animate(withDuration: 0.4, delay: 0.2, options: [], animations: {self.rateButtons[2].alpha = 1.0}, completion: nil)
            UIView.animate(withDuration: 0.4, delay: 0.25, options: [], animations: {self.rateButtons[3].alpha = 1.0}, completion: nil)
            UIView.animate(withDuration: 0.4, delay: 0.3, options: [], animations: {self.rateButtons[4].alpha = 1.0}, completion: nil)
        }
}
