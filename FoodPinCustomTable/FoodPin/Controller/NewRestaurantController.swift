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
    
    @IBOutlet var phoneTextField: IndentedTextField! {
        didSet {
            phoneTextField.tag = 4
            phoneTextField.delegate = self
        }
    }
    
    @IBOutlet var descriptionTextView: IndentedTextField! {
        didSet {
            descriptionTextView.tag = 5
            descriptionTextView.layer.cornerRadius = 5.0
            descriptionTextView.layer.masksToBounds = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
}
