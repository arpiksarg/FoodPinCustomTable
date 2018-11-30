//
//  NewRestaurantController.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 11/30/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class NewRestaurantController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet var nameTextField: IndentedTextField! {
        didSet {
            nameTextField.tag = 1
            nameTextField.becomeFirstResponder()
            nameTextField.delegate = self
        }
    }
    
    @IBOutlet var typeTextField: IndentedTextField! {
        didSet {
            nameTextField.tag = 2
            typeTextField.delegate = self
        }
    }
    
    @IBOutlet var addressTextField: IndentedTextField! {
        didSet {
            addressTextField.tag = 3
            addressTextField.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
