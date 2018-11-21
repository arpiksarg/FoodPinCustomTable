//
//  NavigationControllerExt.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 11/20/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    open override var childForStatusBarStyle: UIViewController? {
        return topViewController
    }
}
