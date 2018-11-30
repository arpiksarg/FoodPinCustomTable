//
//  IndentedTextField.swift
//  FoodPin
//
//  Created by Arpik Sargsyan on 11/30/18.
//  Copyright © 2018 AppCoda. All rights reserved.
//

import UIKit

class IndentedTextField: UITextField {
    
    let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    // returns the drawing rectangle for the text field's text
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }
    
    // returns the drawing rectangle for the text field's placeholder text
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    // returns the rectangle in which editable text can be displayed
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}
