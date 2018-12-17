//
//  WalkthroughPageViewController.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 12/17/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var pageHeadings = ["CREATE YOUR OWN FOOD GUIDE", "SHOW YOU THE LOCATION", "DISCOVER GREAT RESTAURANTS"]
        var pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
        var pageSubheadings = ["Pin your favorite restaurants and craet your own food guide",
                               "Search and locate your favorite restaurant on Maps",
                               "Find restaurants shared by your friends and other foodies"]
        var currentIndex = 0

    }
}
