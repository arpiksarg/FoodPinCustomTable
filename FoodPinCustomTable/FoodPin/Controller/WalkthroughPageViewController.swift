//
//  WalkthroughPageViewController.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 12/17/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

protocol WalkthroughPageViewControllerDelgate: class {
    func didUpdatePageIndex(currentIndex: Int)
}

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {
   
    var pageHeadings = ["CREATE YOUR OWN FOOD GUIDE", "SHOW YOU THE LOCATION", "DISCOVER GREAT RESTAURANTS"]
    var pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
    var pageSubheadings = ["Pin your favorite restaurants and craet your own food guide",
                           "Search and locate your favorite restaurant on Maps",
                           "Find restaurants shared by your friends and other foodies"]
    var currentIndex = 0
    
    weak var walkthroughDelegate: WalkthroughPageViewControllerDelgate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set data source to itself
        
        dataSource = self
        
        // Create the first walkthrough screen
        
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // get the current page index of the given view controller
        
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        // get the current page index of the given view controller
        
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    // helper method that is designed to create the page view controller on demand
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        
        if index < 0 || index >= pageHeadings.count {
            return nil
        }
        
        // Create a new view controller and pass suitable data.
        
        let storyboard = UIStoryboard(name: "Onboarding", bundle: nil)
        if let pageContentViewController = storyboard.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            
            pageContentViewController.imageFile = pageImages[index]
            pageContentViewController.heading = pageHeadings[index]
            pageContentViewController.subHeading = pageSubheadings[index]
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
    }
    
    // Create the next content view controller
    
    func forwardPage() {
        currentIndex += 1
        if let nextViewController = contentViewController(at: currentIndex) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }
}
