//
//  WalkthroughViewController.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 12/17/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class WalkthroughViewController: UIViewController, WalkthroughPageViewControllerDelgate {
   
    func didUpdatePageIndex(currentIndex: Int) {
        updateUI()
    }
    
    
    // Property that stores a reference to the WalkthroughPageViewController object
    
    var walkthroughPageViewController: WalkthroughPageViewController?
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 25.0
            nextButton.layer.masksToBounds = true
        }
    }
    
    @IBOutlet var skipButton: UIButton!
    
    @IBAction func skipButtonTapped(sender: UIButton) {
        
        // Store a status in the user defaults when Skip button is tapped.
        
        UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
       
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                walkthroughPageViewController?.forwardPage()
            case 2:
                
                // Store a status in the user defaults.
                
                UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
                
                dismiss(animated: true, completion: nil)
            default: break
            }
        }
        
        updateUI()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // Get the reference of the Walkthrough View Page Controller
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination
        if let pageViewController = destination as? WalkthroughPageViewController {
            walkthroughPageViewController = pageViewController
            
            //
            
            walkthroughPageViewController?.walkthroughDelegate = self
        }
    }
    
    // updateUI() method controls the title of the next button and skip button appearance
    // changes the indicator of the page control
    
    func updateUI() {
        if let index = walkthroughPageViewController?.currentIndex {
            switch index {
            case 0...1:
                nextButton.setTitle("NEXT", for: .normal)
                
                skipButton.isHidden = false
            
            case 2:
                nextButton.setTitle("GET STARTED", for: .normal)
                skipButton.isHidden = true
            
            default: break
            
            }
            
            pageControl.currentPage = index
        }
    }
}
